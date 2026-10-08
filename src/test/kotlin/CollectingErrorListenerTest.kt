package pro.fbtw.pascal.frontend.parser

import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import pro.fbtw.pascal.frontend.ast.Span
import kotlin.test.Test
import kotlin.test.assertEquals

class CollectingErrorListenerTest {

    private fun errorsOf(source: String): List<SyntaxError> {
        val listener = CollectingErrorListener()
        val lexer = PascalLexer(CharStreams.fromString(source)).apply {
            removeErrorListeners(); addErrorListener(listener)
        }
        val parser = PascalParser(CommonTokenStream(lexer)).apply {
            removeErrorListeners(); addErrorListener(listener)
        }
        parser.program()

        return listener.errors
    }

    @Test
    fun `conforming program has no errors`() {
        assertEquals(emptyList(), errorsOf("program p;\nbegin\nend."))
    }

    @Test
    fun `character outside the alphabet is reported with its span`() {
        val expected = SyntaxError(
            SyntaxErrorCode.UNRECOGNIZED_CHARACTER,
            "character '_' is not in the alphabet",
            Span(21, 22, 3, 5),
        )

        assertEquals(listOf(expected), errorsOf("program p;\nbegin\n   a_ := 1\nend."))
    }

    @Test
    fun `unterminated character-string is reported up to the end of its line`() {
        val expected = SyntaxError(
            SyntaxErrorCode.UNTERMINATED_STRING,
            "unterminated character-string",
            Span(25, 29, 3, 9),
            helps = listOf("close the character-string with an apostrophe on the same line"),
        )

        // The assignment has lost its expression, so the parser reports as well.
        assertEquals(expected, errorsOf("program p;\nbegin\n   a := 'abc\nend.").first())
    }

    @Test
    fun `unterminated commentary is reported at its opening`() {
        for (opening in listOf("{", "(*")) {
            val error = errorsOf("program p;\nbegin\n   $opening never closed\nend.").first()

            assertEquals(SyntaxErrorCode.UNTERMINATED_COMMENT, error.code, "wrong code for '$opening'")
            assertEquals(Span(20, 21, 3, 4), error.span, "wrong span for '$opening'")
        }
    }

    @Test
    fun `missing token names what is absent`() {
        val expected = SyntaxError(SyntaxErrorCode.MISSING_TOKEN, "missing ';' before 'begin'", Span(10, 15, 2, 1))

        assertEquals(listOf(expected), errorsOf("program p\nbegin\nend."))
    }

    @Test
    fun `extraneous token is reported with what was expected`() {
        val expected = SyntaxError(
            SyntaxErrorCode.EXTRANEOUS_TOKEN,
            "extraneous ';'",
            Span(10, 11, 1, 11),
            helps = listOf("remove ';'"),
            notes = listOf("expected 'begin', 'const', 'function', 'label', 'procedure', 'type' or 'var'"),
        )

        assertEquals(listOf(expected), errorsOf("program p;;\nbegin\nend."))
    }

    @Test
    fun `unexpected token is reported with what was expected`() {
        val expected = SyntaxError(
            SyntaxErrorCode.UNEXPECTED_TOKEN,
            "unexpected 'begin'",
            Span(0, 5, 1, 1),
            notes = listOf("expected 'program'"),
        )

        assertEquals(listOf(expected), errorsOf("begin\nend."))
    }

    @Test
    fun `end of file is reported with an empty span`() {
        val expected = SyntaxError(SyntaxErrorCode.MISSING_TOKEN, "missing '.' before end of file", Span(20, 20, 3, 4))

        assertEquals(listOf(expected), errorsOf("program p;\nbegin\nend"))
    }

    @Test
    fun `report that cannot be classified becomes an unknown error`() {
        val listener = CollectingErrorListener()

        listener.syntaxError(null, null, 3, 4, "something odd", null)

        val offset = SyntaxError.UNKNOWN_OFFSET
        assertEquals(
            listOf(SyntaxError(SyntaxErrorCode.UNKNOWN, "something odd", Span(offset, offset, 3, 5))),
            listener.errors,
        )
    }
}
