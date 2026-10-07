package pro.fbtw.pascal.frontend.parser

import org.antlr.v4.runtime.BaseErrorListener
import org.antlr.v4.runtime.RecognitionException
import org.antlr.v4.runtime.Recognizer


class CollectingErrorListener(val errorProvider: (Int, Int, String) -> SyntaxError) : BaseErrorListener() {
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
        _errors += errorProvider(line, charPositionInLine, msg)
    }
}