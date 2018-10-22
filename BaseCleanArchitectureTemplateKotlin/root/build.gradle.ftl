/* 1st:Merge below settings to app's build.gradle
   2nd:Remove this file !!  */

<#compress>
// FIXME add below to file top
apply plugin: 'kotlin-kapt'
apply plugin: 'androidx.navigation.safeargs'
apply plugin: "com.github.konifar.gradle.unused-resources-remover"
<#if includeRealm>
apply plugin: 'realm-android'
</#if>
</#compress>

// FIXME merge belows
android {
    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
        test.java.srcDirs += 'src/test/kotlin'
        androidTest.java.srcDirs += 'src/androidTest/kotlin'
        main.kotlin.srcDirs += 'src/main/kotlin'
        test.kotlin.srcDirs += 'src/test/kotlin'
        androidTest.kotlin.srcDirs += 'src/androidTest/kotlin'
    }

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
            // FIXME replace `minifyEnabled false` to `minifyEnabled true`
            debuggable false
            zipAlignEnabled true
            shrinkResources true
          // library proguard settings
          def files = rootProject.file("proguard")
                  .listFiles()
                  .findAll { it.name.startsWith("proguard") }
                  .toList()
                  .toArray()
          proguardFiles(files)
        }
    }
    testOptions {
        unitTests.includeAndroidResources true
    }
}

// FIXME merge below!
dependencies {
    kapt 'com.android.databinding:compiler:3.+'
    kapt 'com.google.dagger:dagger-compiler:2.+'
    kapt 'com.google.dagger:dagger-android-processor:2.+'
    androidTestImplementation 'androidx.test.espresso:espresso-contrib:+', {
        exclude group: 'com.android.support'
    }
}

// FIXME add below to file end!
configurations.all {
    //FIXME replace version to SAME support Library Version!!
    resolutionStrategy.force "com.android.support:support-annotations:+"
}

// FIXME add below to file end!
clean.dependsOn(removeUnusedResources)
