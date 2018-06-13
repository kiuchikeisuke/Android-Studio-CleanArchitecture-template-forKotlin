<#if includeRealm>
buildscript {
apply from: "$rootDir.absolutePath/versions.gradle"
repositories {
    google()
    jcenter()
    maven { url "https://plugins.gradle.org/m2/" }
}
    dependencies {
        classpath 'com.android.tools.build:gradle:${gradlePluginVersion}'
        <#if includeKotlinSupport!false>classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"</#if>
        classpath "io.realm:realm-gradle-plugin:+"
        classpath "gradle.plugin.com.github.konifar.gradle:plugin:+"

    // NOTE: Do not place your application dependencies here; they belong
    // in the individual module build.gradle files
}
}

<#else>
buildscript {
apply from: "$rootDir.absolutePath/versions.gradle"
repositories {
    google()
    jcenter()
    maven { url "https://plugins.gradle.org/m2/" }
}
    dependencies {
        classpath 'com.android.tools.build:gradle:${gradlePluginVersion}'
        <#if includeKotlinSupport!false>classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"</#if>
        classpath "gradle.plugin.com.github.konifar.gradle:plugin:+"

    // NOTE: Do not place your application dependencies here; they belong
    // in the individual module build.gradle files
}
}
</#if>

allprojects {
    repositories {
        google()
        jcenter()
    }
}

task clean(type: Delete) {
    delete rootProject.buildDir
}
