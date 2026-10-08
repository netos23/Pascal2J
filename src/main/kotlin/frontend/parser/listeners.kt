package pro.fbtw.pascal.frontend.parser

import org.antlr.v4.runtime.BaseErrorListener
import org.antlr.v4.runtime.InputMismatchException
import org.antlr.v4.runtime.Lexer
import org.antlr.v4.runtime.LexerNoViableAltException
import org.antlr.v4.runtime.NoViableAltException
import org.antlr.v4.runtime.Parser
import org.antlr.v4.runtime.RecognitionException
import org.antlr.v4.runtime.Recognizer
import org.antlr.v4.runtime.Token
import org.antlr.v4.runtime.misc.Interval
import org.antlr.v4.runtime.misc.IntervalSet
import pro.fbtw.pascal.frontend.ast.Span


class CollectingErrorListener : BaseErrorListener() {
    private val _errors = mutableListOf<SyntaxError>()
    val errors: List<SyntaxError> get() = _errors

    override fun syntaxError(
        recognizer: Recognizer<*, *>?,
        offendingSymbol: Any?,
        line: Int,
        charPositionInLine: Int,
        msg: String,
        e: RecognitionException?,
    ) {
        _errors += when (recognizer) {
            is Lexer if e is LexerNoViableAltException ->
                lexicalError(recognizer, line, charPositionInLine, e)

            is Parser if offendingSymbol is Token ->
                syntacticError(recognizer, offendingSymbol, msg, e)

            else -> {
                val offset = SyntaxError.UNKNOWN_OFFSET
                SyntaxError(SyntaxErrorCode.UNKNOWN, msg, Span(offset, offset, line, charPositionInLine + 1))
            }
        }
    }

    private fun lexicalError(
        lexer: Lexer,
        line: Int,
        charPositionInLine: Int,
        e: LexerNoViableAltException
    ): SyntaxError {
        val input = lexer.inputStream
        val start = e.startIndex
        // The lexer stops on the character it could not accept, which is still part of the bad text.
        val stop = minOf(input.index(), input.size() - 1)
        val text = input.getText(Interval.of(start, stop)).trimEnd()

        fun span(length: Int) = Span(start, start + length, line, charPositionInLine + 1)

        return when {
            text.startsWith("'") -> SyntaxError(
                SyntaxErrorCode.UNTERMINATED_STRING,
                "unterminated character-string",
                span(text.length),
                helps = listOf("close the character-string with an apostrophe on the same line"),
            )

            text.startsWith("{") || text.startsWith("(*") -> SyntaxError(
                SyntaxErrorCode.UNTERMINATED_COMMENT,
                "unterminated commentary",
                span(1),
                helps = listOf("close the commentary with '}' or '*)'"),
            )

            else -> {
                val character = String(Character.toChars(text.codePointAt(0)))
                SyntaxError(
                    SyntaxErrorCode.UNRECOGNIZED_CHARACTER,
                    "character '$character' is not in the alphabet",
                    span(character.length),
                )
            }
        }
    }

    private fun syntacticError(parser: Parser, token: Token, msg: String, e: RecognitionException?): SyntaxError {
        val span = Span(
            token.startIndex,
            maxOf(token.startIndex, token.stopIndex + 1),
            token.line,
            token.charPositionInLine + 1,
        )
        val found = if (token.type == Token.EOF) "end of file" else "'${token.text}'"
        val expected = (e?.expectedTokens ?: parser.expectedTokens).describe(parser)

        return when (e) {
            null if msg.startsWith("missing") ->
                SyntaxError(SyntaxErrorCode.MISSING_TOKEN, "missing $expected before $found", span)

            null -> SyntaxError(
                SyntaxErrorCode.EXTRANEOUS_TOKEN,
                "extraneous $found",
                span,
                helps = listOf("remove $found"),
                notes = listOf("expected $expected"),
            )

            is InputMismatchException -> SyntaxError(
                SyntaxErrorCode.UNEXPECTED_TOKEN,
                "unexpected $found",
                span,
                notes = listOf("expected $expected")
            )

            is NoViableAltException -> SyntaxError(SyntaxErrorCode.INVALID_SYNTAX, "invalid syntax near $found", span)

            else -> SyntaxError(SyntaxErrorCode.UNKNOWN, msg, span)
        }
    }

    private fun IntervalSet.describe(parser: Parser): String {
        val names = toList().map { type ->
            TOKEN_NAMES[type] ?: parser.vocabulary.getLiteralName(type) ?: parser.vocabulary.getDisplayName(type)
        }

        return when (names.size) {
            0 -> "nothing"
            1 -> names.single()
            else -> names.dropLast(1).joinToString(", ") + " or " + names.last()
        }
    }

    private companion object {
        // Tokens without a literal spelling are named after their ISO 7185 productions.
        val TOKEN_NAMES = mapOf(
            Token.EOF to "end of file",
            PascalLexer.IDEN to "identifier",
            PascalLexer.STRING to "character-string",
            PascalLexer.UNSIGNED_INTEGER to "unsigned-integer",
            PascalLexer.UNSIGNED_REAL to "unsigned-real",
        )
    }
}
