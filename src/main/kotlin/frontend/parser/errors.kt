package pro.fbtw.pascal.frontend.parser

import pro.fbtw.pascal.frontend.ast.Span
import pro.fbtw.pascal.util.Diagnostic
import pro.fbtw.pascal.util.DiagnosticSeverity

/**
 * The kinds of problem the lexer and the parser report.
 * Codes 1xxx are lexical (ISO 7185 6.1), codes 2xxx are syntactic.
 * A test source spells a code as `E` and four digits, e.g. `E1001`.
 */
enum class SyntaxErrorCode(val id: Int) {
    /** A problem the lexer or the parser reported that fits none of the other codes. */
    UNKNOWN(0),

    /** A character that is neither in the alphabet nor part of a special-symbol. */
    UNRECOGNIZED_CHARACTER(1001),

    /** A character-string that is not closed by an apostrophe on its own line. */
    UNTERMINATED_STRING(1002),

    /** A commentary that is not closed before the end of the source. */
    UNTERMINATED_COMMENT(1003),

    /** A required token is absent; parsing continued as if it was there. */
    MISSING_TOKEN(2001),

    /** A token that does not belong; parsing continued as if it was not there. */
    EXTRANEOUS_TOKEN(2002),

    /** A token other than the ones the construct being read allows. */
    UNEXPECTED_TOKEN(2003),

    /** The input does not start any construct allowed at this point. */
    INVALID_SYNTAX(2004),
}

/**
 * A problem found by the lexer or the parser.
 * The [span] covers the offending text; its column is 1-based.
 */
data class SyntaxError(
    val code: SyntaxErrorCode,
    override val message: String,
    override val span: Span,
    override val helps: List<String> = emptyList(),
    override val notes: List<String> = emptyList(),
) : Diagnostic {
    override val severity: DiagnosticSeverity get() = DiagnosticSeverity.ERROR
    override val errorCode: Int get() = code.id

    companion object {
        /** The offset of a [Span] whose place in the source text is not known. */
        const val UNKNOWN_OFFSET = -1

        private const val MARKER = "!!SyntaxError"

        // !!SyntaxError[E<code>]: <message> at <line>:<column>!!
        private val NOTICE = Regex("""!!SyntaxError\[E(\d{4})]:\s*(.+?)\s+(?i:at)\s+(\d+):(\d+)\s*!!""")

        /** Reads the notice contained in [str], failing if there is none. */
        fun parse(str: String): SyntaxError =
            parseOrNull(str) ?: throw IllegalArgumentException("not a syntax error or malformed syntax error: $str")

        /**
         * Reads the notice contained in [str], or returns null if [str] carries no notice at all.
         * A notice that is present but malformed is a null.
         *
         * A notice names the code, the message and the line and column of the error,
         * so the offsets of the resulting [span] are [UNKNOWN_OFFSET].
         */
        fun parseOrNull(str: String): SyntaxError? {
            if (MARKER !in str) return null

            val match = NOTICE.find(str) ?: return null
            val (id, message, line, column) = match.destructured
            val code = SyntaxErrorCode.entries.find { it.id == id.toInt() }
                ?: return null

            return line.toIntOrNull()?.let { line ->
                column.toIntOrNull()?.let { column ->
                    SyntaxError(
                        code, message,
                        Span(UNKNOWN_OFFSET, UNKNOWN_OFFSET, line, column)
                    )
                }
            }

        }
    }
}
