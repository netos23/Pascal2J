package pro.fbtw.pascal.util

import pro.fbtw.pascal.frontend.ast.Span

/**
 * The severity of a diagnostic message.
 */
enum class DiagnosticSeverity {
    /**
     * Debug severity. Used for extra debug information about build.
     */
    DEBUG,
    /**
     * Info severity. Used for useful information about phase of the build.
     */
    INFO,
    /**
     * Warning severity. Used for describe problem that can cause runtime or performance issue.
     */
    WARNING,
    /**
     * Error severity. Used for blocking problem that cause stop compilation process.
     */
    ERROR
}

/**
 * Represents a diagnostic message with information about a problem in the code.
 */
interface Diagnostic {
    /**
     * The severity of the diagnostic.
     */
    val severity: DiagnosticSeverity

    /**
     * Short information message about problem
     */
    val message: String

    /**
     * Error code associated with the problem if present
     */
    val errorCode: Int?

    /**
     * Span of the code that is causing the problem if present
     */
    val span: Span?

    /**
     * List of helpful suggestions for resolving the problem. May be empty.
     */
    val helps: List<String>

    /**
     * List of additional notes about the problem. May be empty.
     */
    val notes: List<String>
}