<#compress>
<#if includeRealm>
// FIXME comment out this!! and move to file top!!
// apply plugin: 'realm-android'
</#if>
// FIXME comment out this!! and move to file top!!
// apply plugin: 'kotlin-kapt'
</#compress>

android {
  sourceSets {
      main.java.srcDirs += 'src/main/kotlin'
      test.java.srcDirs += 'src/test/kotlin'
      androidTest.java.srcDirs += 'src/androidTest/kotlin'
      main.kotlin.srcDirs += 'src/main/kotlin'
      test.kotlin.srcDirs += 'src/test/kotlin'
      androidTest.kotlin.srcDirs += 'src/androidTest/kotlin'  }

  compileOptions {
      sourceCompatibility JavaVersion.VERSION_1_8
      targetCompatibility JavaVersion.VERSION_1_8
  }
  dataBinding {
      enabled true
  }
  buildTypes {
      debug {
          signingConfig signingConfigs.debug
          versionNameSuffix "-debug"
      }
      release {
          debuggable false
          zipAlignEnabled true
          minifyEnabled true
          shrinkResources true
//          FIXME comment out this!!
//          proguardFiles {
//              getDefaultProguardFile('proguard-android.txt')
//              "proguard-rules.pro"
//          }
//          def files = rootProject.file("proguard")
//                  .listFiles()
//                  .findAll { it.name.startsWith("proguard") }
//                  .toList()
//                  .toArray()
//          proguardFiles(files)
      }
  }
}

dependencies {
<#compress>
  kapt 'com.google.dagger:dagger-compiler:2.+'
  kapt 'com.google.dagger:dagger-android-processor:2.+'
</#compress>
}
