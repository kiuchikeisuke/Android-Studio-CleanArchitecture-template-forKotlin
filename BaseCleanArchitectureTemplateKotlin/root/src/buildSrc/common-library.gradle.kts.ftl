import de.mannodermaus.gradle.plugins.junit5.junitPlatform

plugins {
    id("com.android.library")
    id("kotlin-android")
    id("kotlin-android-extensions")
    id("kotlin-kapt")
    id("de.mannodermaus.android-junit5")
}

android {
    compileSdkVersion(Versions.compileSdk)
    defaultConfig {
        minSdkVersion(Versions.minSdk)
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        testInstrumentationRunnerArgument("runnerBuilder", "de.mannodermaus.junit5.AndroidJUnit5Builder")
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    buildTypes {
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
            versionNameSuffix = "-dubug"
        }
        getByName("release") {
            isMinifyEnabled = false
            isDebuggable = false
            isZipAlignEnabled = true
            isShrinkResources = true
            consumerProguardFile(file("proguard-rules.pro"))
        }
    }

    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
        getByName("test").java.srcDirs("src/test/kotlin")
        getByName("androidTest").java.srcDirs("src/androidTest/kotlin")
    }

    testOptions {
        junitPlatform {
            filters {
                includeEngines("spek2")
                includeEngines("junit-vintage")
            }
        }
        unitTests.isIncludeAndroidResources = true
    }


    dexOptions.javaMaxHeapSize = "2g"
}

dependencies {
    implementation(fileTree(mapOf("dir" to "libs", "include" to arrayOf("*.jar"))))
    kapt(Deps.Dagger.compiler)
    kapt(Deps.Dagger.processor)
    implementation(Deps.Dagger.core)
    implementation(Deps.Dagger.android)
    implementation(Deps.Dagger.androidSupport)
    implementation(Deps.RxJava.core)
    implementation(Deps.RxJava.kotlin)
    implementation(Deps.RxJava.android)
    implementation(Deps.Timber.core)
    implementation(Deps.Threetenabp.core)

    testImplementation(Deps.Test.Spek.core)
    testImplementation(Deps.Test.Spek.runner)
    testImplementation(Deps.Test.MockK.core)
    testImplementation(Deps.Test.Kotlin.core)
    testImplementation(Deps.Test.Kotlin.junit)
    testImplementation(Deps.Test.Kotlin.reflect)
    testImplementation(Deps.Test.Kotlin.stdlibJdk)
    testImplementation(Deps.Test.JUnit.core)
    testImplementation(Deps.Test.JUnit.runner)
    testImplementation(Deps.Test.JUnit.jupiterApi)
    testImplementation(Deps.Test.JUnit.jupiterEngine)
    testImplementation(Deps.Test.JUnit.vintageEngine)

    androidTestImplementation(Deps.Test.AndroidX.runner)
    androidTestImplementation(Deps.Test.AndroidX.espresso)
}

kotlin {
    sourceSets.all {
        languageSettings.progressiveMode = true
    }
}