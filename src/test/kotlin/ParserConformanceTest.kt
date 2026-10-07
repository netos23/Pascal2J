package pro.fbtw.pascal.frontend.parser

import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import java.nio.file.Files
import java.nio.file.Path
import kotlin.collections.emptyList
import kotlin.collections.isNotEmpty
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class ParserConformanceTest {

    private fun errorsOf(file: Path): List<SyntaxError> {
        val lexerListener = CollectingErrorListener(::LexerSyntaxError)
        val parserListener = CollectingErrorListener(::ParserSyntaxError)
        val lexer = PascalLexer(CharStreams.fromPath(file)).apply {
            removeErrorListeners(); addErrorListener(lexerListener)
        }
        val parser = PascalParser(CommonTokenStream(lexer)).apply {
            removeErrorListeners(); addErrorListener(parserListener)
        }
        parser.program()
        return lexerListener.errors + parserListener.errors
    }

    private fun sources(dir: String): List<Path> =
        Files.walk(Path.of("testSourses", dir)).use { s ->
            s.filter { it.toString().endsWith(".pas") }.toList()
        }

    @Test
    fun `conforming lexer consumes sources cleanly`() {
        for (file in sources("ok")) {
            assertEquals(emptyList(), errorsOf(file), "unexpected errors in $file")
        }
    }

    @Test
    fun `syntax errors are reported`() {
        for (file in sources("err/syntax") + sources("err/lexical")) {
            assertTrue(errorsOf(file).isNotEmpty(), "expected an error in $file")
        }
    }
}