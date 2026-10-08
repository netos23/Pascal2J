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

    private fun errorsOf(file: Path): Pair<List<SyntaxError>, List<SyntaxError>> {
        val listener = CollectingErrorListener()
        val lexer = PascalLexer(CharStreams.fromPath(file)).apply {
            removeErrorListeners(); addErrorListener(listener)
        }

        val commonTokenStream = CommonTokenStream(lexer)
        commonTokenStream.fill()
        val expectedErrors = commonTokenStream.tokens.filter { it.type == PascalLexer.COMMENT }
            .mapNotNull { SyntaxError.parseOrNull(it.text) }


        val parser = PascalParser(commonTokenStream).apply {
            removeErrorListeners(); addErrorListener(listener)
        }
        parser.program()

        return listener.errors to expectedErrors
    }

    // A notice carries no offsets, and its message is a description, so errors are matched by code and position.
    private fun List<SyntaxError>.places(): List<Triple<SyntaxErrorCode, Int, Int>> =
        map { Triple(it.code, it.span.line, it.span.column) }.sortedWith(compareBy({ it.second }, { it.third }, { it.first }))

    private fun sources(dir: String): List<Path> = Files.walk(Path.of("testSourses", dir)).use { s ->
        s.filter { it.toString().endsWith(".pas") }.toList()
    }

    @Test
    fun `conforming lexer consumes sources cleanly`() {
        for (file in sources("ok")) {
            val (actual, expected) = errorsOf(file)

            assertEquals(emptyList(), expected, "Unrelated errors in $file")
            assertEquals(emptyList(), actual, "unexpected errors in $file")
        }
    }

    @Test
    fun `syntax errors are reported`() {
        for (file in sources("err/syntax") + sources("err/lexical")) {
            val (actual, expected) = errorsOf(file)
            assertTrue(expected.isNotEmpty(), "no error is announced in $file")
            assertEquals(expected.places(), actual.places(), "wrong errors in $file")
        }
    }
}