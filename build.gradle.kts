plugins {
    kotlin("jvm") version "2.3.10"
    id("antlr")
}

group = "pro.fbtw.pascal"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    antlr("org.antlr:antlr4:4.13.2")
    implementation("org.antlr:antlr4-runtime:4.13.2")
    testImplementation(kotlin("test"))
}

kotlin {
    jvmToolchain(18)
}

tasks.generateGrammarSource {
    arguments = arguments + listOf(
        "-visitor",                  // emit Pascal{Visitor,BaseVisitor}
        "-package", "pro.fbtw.pascal.frontend.parser",
        "-long-messages",            // full rule context in grammar warnings
    )
}

tasks.named("compileKotlin") { dependsOn(tasks.generateGrammarSource) }
tasks.named("compileTestKotlin") { dependsOn(tasks.generateTestGrammarSource) }

tasks.test {
    useJUnitPlatform()
}

