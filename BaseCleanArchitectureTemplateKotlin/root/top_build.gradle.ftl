/* 1st:Merge below settings to Project's build.gradle
   2nd:Remove this file !!  */

buildscript {
    // FIXME add belows
    repositories {
        maven { url "https://plugins.gradle.org/m2/" }
        maven { url "https://oss.sonatype.org/content/repositories/snapshots" }
    }
    dependencies {
        <#if includeRealm>classpath "io.realm:realm-gradle-plugin:+"</#if>
        classpath "gradle.plugin.com.github.konifar.gradle:plugin:+"
        classpath "de.mannodermaus.gradle.plugins:android-junit5:1.3.1.1"
        classpath "android.arch.navigation:navigation-safe-args-gradle-plugin:+"
    }
}
