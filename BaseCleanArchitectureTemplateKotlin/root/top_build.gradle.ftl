<#if includeRealm>
buildscript {
  dependencies {
    classpath "io.realm:realm-gradle-plugin:+"
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
