package pro.fbtw.pascal.frontend.parser

import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import pro.fbtw.pascal.frontend.ast.Span
import pro.fbtw.pascal.frontend.parser.SyntaxErrorCode.EXTRANEOUS_TOKEN
import pro.fbtw.pascal.frontend.parser.SyntaxErrorCode.MISSING_TOKEN
import pro.fbtw.pascal.frontend.parser.SyntaxErrorCode.UNEXPECTED_TOKEN
import pro.fbtw.pascal.frontend.parser.SyntaxErrorCode.UNRECOGNIZED_CHARACTER
import pro.fbtw.pascal.util.DiagnosticSeverity
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull

class SyntaxErrorTest {

    private fun error(code: SyntaxErrorCode, message: String, line: Int, column: Int) =
        SyntaxError(code, message, Span(SyntaxError.UNKNOWN_OFFSET, SyntaxError.UNKNOWN_OFFSET, line, column))

    @Test
    fun `syntax error is an error diagnostic carrying its code`() {
        val error = error(MISSING_TOKEN, "message", 1, 2)

        assertEquals(DiagnosticSeverity.ERROR, error.severity)
        assertEquals(2001, error.errorCode)
        assertEquals(emptyList(), error.helps)
        assertEquals(emptyList(), error.notes)
    }

    @Test
    fun `conforming syntax errors are parsed cleanly`() {
        assertEquals(error(MISSING_TOKEN, "message", 1, 2), SyntaxError.parse("!!SyntaxError[E2001]: message At 1:2!!"))
        assertEquals(
            error(UNEXPECTED_TOKEN, "Long long message", 1, 2),
            SyntaxError.parse("!!SyntaxError[E2003]: Long long message At 1:2!!"),
        )
    }

    @Test
    fun `every error code can be written in a notice`() {
        for (code in SyntaxErrorCode.entries) {
            val notice = "!!SyntaxError[E%04d]: message at 1:2!!".format(code.id)

            assertEquals(error(code, "message", 1, 2), SyntaxError.parse(notice))
        }
    }

    @Test
    fun `location keyword is case insensitive`() {
        val expected = error(MISSING_TOKEN, "message", 13, 11)

        assertEquals(expected, SyntaxError.parse("!!SyntaxError[E2001]: message at 13:11!!"))
        assertEquals(expected, SyntaxError.parse("!!SyntaxError[E2001]: message At 13:11!!"))
        assertEquals(expected, SyntaxError.parse("!!SyntaxError[E2001]: message AT 13:11!!"))
    }

    @Test
    fun `notice is found inside a comment`() {
        val expected = error(UNRECOGNIZED_CHARACTER, "Charecter not in alphabet", 11, 11)

        assertEquals(expected, SyntaxError.parse("{! !!SyntaxError[E1001]: Charecter not in alphabet at 11:11!! !}"))
        assertEquals(expected, SyntaxError.parse("(* !!SyntaxError[E1001]: Charecter not in alphabet at 11:11!! *)"))
        assertEquals(expected, SyntaxError.parse("{!!SyntaxError[E1001]: Charecter not in alphabet at 11:11!!}"))
    }

    @Test
    fun `whitespace around the parts is ignored`() {
        assertEquals(error(MISSING_TOKEN, "message", 1, 2), SyntaxError.parse("!!SyntaxError[E2001]:message   at  1:2  !!"))
    }

    @Test
    fun `message may contain the location keyword and punctuation`() {
        assertEquals(
            error(UNRECOGNIZED_CHARACTER, "token recognition error at: '?'", 3, 4),
            SyntaxError.parse("!!SyntaxError[E1001]: token recognition error at: '?' at 3:4!!"),
        )
        assertEquals(
            error(EXTRANEOUS_TOKEN, "look at 1:2 again", 5, 6),
            SyntaxError.parse("!!SyntaxError[E2002]: look at 1:2 again at 5:6!!"),
        )
        assertEquals(
            error(UNRECOGNIZED_CHARACTER, "character '!' is not in the alphabet", 7, 8),
            SyntaxError.parse("!!SyntaxError[E1001]: character '!' is not in the alphabet at 7:8!!"),
        )
    }

    @Test
    fun `text without a notice is not a syntax error`() {
        for (str in listOf("", "{ plain comment }", "(* Expected diagnostic: identifier expected. *)", "SyntaxError[E2001]: message at 1:2")) {
            assertNull(SyntaxError.parseOrNull(str), "unexpected notice in '$str'")
            assertFailsWith<IllegalArgumentException>("expected a failure for '$str'") { SyntaxError.parse(str) }
        }
    }

    @Test
    fun `malformed notices are rejected`() {
        val malformed = listOf(
            "!!SyntaxError: message at 1:2!!",              // no code
            "!!SyntaxError[]: message at 1:2!!",            // empty code
            "!!SyntaxError[2001]: message at 1:2!!",        // code without its letter
            "!!SyntaxError[E201]: message at 1:2!!",        // code is not four digits
            "!!SyntaxError[E20010]: message at 1:2!!",      // code is not four digits
            "!!SyntaxError[E4242]: message at 1:2!!",       // no such code
            "!!SyntaxError[E2001]: message!!",              // no location
            "!!SyntaxError[E2001]: message at 1!!",         // no column
            "!!SyntaxError[E2001]: message at 1:!!",        // empty column
            "!!SyntaxError[E2001]: message at :2!!",        // empty line
            "!!SyntaxError[E2001]: message at one:two!!",   // not numbers
            "!!SyntaxError[E2001]: message at -1:2!!",      // negative line
            "!!SyntaxError[E2001]: message at 1:2",         // not closed
            "!!SyntaxError[E2001]: at 1:2!!",               // no message
            "!!SyntaxError[E2001] message at 1:2!!",        // no colon after the code
            "!!SyntaxError[E2001]: message at 99999999999:2!!", // line does not fit an Int
        )

        for (str in malformed) {
            assertFailsWith<IllegalArgumentException>("expected a failure for '$str'") { SyntaxError.parse(str) }
            assertFailsWith<IllegalArgumentException>("expected a failure for '$str'") { SyntaxError.parseOrNull(str) }
        }
    }

    @Test
    fun `notices are read from the hidden channel`() {
        val source = """
            (* An ordinary comment, not a notice. *)
            program P(output);
            begin
               {! !!SyntaxError[E1001]: first at 5:11!! !}
               i := 1 ? 2;
               (* !!SyntaxError[E2003]: second at 7:11!! *)
               i := i ! 3
            end.
        """.trimIndent()

        val tokens = CommonTokenStream(PascalLexer(CharStreams.fromString(source)).apply { removeErrorListeners() })
        tokens.fill()
        val notices = tokens.tokens
            .filter { it.type == PascalLexer.COMMENT }
            .mapNotNull { SyntaxError.parseOrNull(it.text) }

        assertEquals(
            listOf(error(UNRECOGNIZED_CHARACTER, "first", 5, 11), error(UNEXPECTED_TOKEN, "second", 7, 11)),
            notices,
        )
    }
}
