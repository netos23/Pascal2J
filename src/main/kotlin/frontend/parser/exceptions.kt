package pro.fbtw.pascal.frontend.parser

interface SyntaxError  {
    val line: Int
    val column: Int
    val message: String
}

data class LexerSyntaxError(
    override val line: Int,
    override val column: Int,
    override val message: String
) : SyntaxError

data class ParserSyntaxError(
    override val line: Int,
    override val column: Int,
    override val message: String
) : SyntaxError