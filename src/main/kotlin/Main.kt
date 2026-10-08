package pro.fbtw.pascal

import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import pro.fbtw.pascal.frontend.parser.PascalLexer
import pro.fbtw.pascal.frontend.parser.PascalParser
import java.nio.file.Path

fun main(args: Array<String>) {
    val file = Path.of(args.first())

    val lexer = PascalLexer(CharStreams.fromPath(file))
    val tokens = CommonTokenStream(lexer)
    val parser = PascalParser(tokens)

    val tree: PascalParser.ProgramContext = parser.program()   // start rule

    if (parser.numberOfSyntaxErrors == 0) {
        println(tree.toStringTree(parser))
    }
}