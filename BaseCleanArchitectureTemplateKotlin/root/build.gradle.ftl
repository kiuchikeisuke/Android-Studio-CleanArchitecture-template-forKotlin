<#compress>
<#if includeRealm>
// FIXME comment out this!! and move to file top!!
// apply plugin: 'realm-android'
</#if>
// FIXME comment out this!! and move to file top!!
// apply plugin: 'kotlin-kapt'
// apply plugin: "com.github.konifar.gradle.unused-resources-remover"


// FIXME comment out this!! and move to file end!!
// clean.dependsOn(removeUnusedResources)
</#compress>

android {
  defaultConfig {
     testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
}
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
//          proguardFile getDefaultProguardFile('proguard-android.txt')
//          // global proguard settings
//          proguardFile file("proguard-rules.pro")
//          // library proguard settings
//          def files = rootProject.file("proguard")
//                  .listFiles()
//                  .findAll { it.name.startsWith("proguard") }
//                  .toList()
//                  .toArray()
//          proguardFiles(files)
      }
  }
  testOptions {
      unitTests.includeAndroidResources true
  }
}

dependencies {
<#compress>
  kapt 'com.android.databinding:compiler:3.+'
  kapt 'com.google.dagger:dagger-compiler:2.+'
  kapt 'com.google.dagger:dagger-android-processor:2.+'
</#compress>
}

// FIXME add dependencies
//  androidTestImplementation 'com.android.support.test.espresso:espresso-contrib:3.0.2', {
//      exclude group: 'com.android.support'
//  }

configurations.all {
    //FIXME replace version to SAME support Library Version!!
    resolutionStrategy.force "com.android.support:support-annotations:${buildApi}.+"
}
