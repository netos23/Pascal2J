plugins {
    kotlin("jvm") version "2.3.10"
}

group = "pro.fbtw"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(kotlin("test"))
}

kotlin {
    jvmToolchain(18)
}

tasks.test {
    useJUnitPlatform()
}