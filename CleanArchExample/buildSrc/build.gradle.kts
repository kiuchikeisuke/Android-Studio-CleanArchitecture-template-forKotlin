plugins {
    `kotlin-dsl`
}

repositories {
    google()
    jcenter()
}

dependencies {
    implementation("com.android.tools.build:gradle:3.4.1")
    implementation("org.jetbrains.kotlin:kotlin-gradle-plugin:1.3.31")
    implementation("de.mannodermaus.gradle.plugins:android-junit5:1.3.1.1")
}