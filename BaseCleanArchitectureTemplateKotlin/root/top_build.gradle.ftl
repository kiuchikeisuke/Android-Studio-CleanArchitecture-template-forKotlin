<#if includeRealm>
buildscript {
  dependencies {
    classpath "io.realm:realm-gradle-plugin:+"
    classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    classpath "org.jetbrains.kotlin:kotlin-android-extensions:$kotlin_version"
  }
}
</#if>

allprojects {
    repositories {
        maven {
            url 'https://oss.sonatype.org/content/repositories/snapshots/'
        }
    }
}
