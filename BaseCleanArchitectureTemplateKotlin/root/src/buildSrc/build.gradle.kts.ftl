plugins {
    `kotlin-dsl`
}

repositories {
    maven(url = "https://plugins.gradle.org/m2/")
    maven(url = "https://oss.sonatype.org/content/repositories/snapshots")
    google()
    mavenCentral()
    jcenter()
}

dependencies {
//FIXME: Change to the appropriate version, and delete unnecessary/conflict definitions compared to ./build.gradle
implementation("com.android.tools.build:gradle:3.5.3")
implementation("org.jetbrains.kotlin:kotlin-gradle-plugin:1.3.61")
implementation("de.mannodermaus.gradle.plugins:android-junit5:1.4.2.1")
implementation("android.arch.navigation:navigation-safe-args-gradle-plugin:+")
<#if includeRealm>implementation("io.realm:realm-gradle-plugin:+")</#if>
}