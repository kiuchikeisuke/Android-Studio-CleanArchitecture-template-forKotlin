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

    dexOptions.javaMaxHeapSize = "2g"
}

dependencies {
    kapt(Deps.Dagger.compiler)
    kapt(Deps.Dagger.processor)
    implementation(Deps.Dagger.core)
    implementation(Deps.Dagger.android)
    implementation(Deps.Dagger.androidSupport)
    implementation(Deps.RxJava.core)
    implementation(Deps.RxJava.kotlin)
    implementation(Deps.RxJava.android)
    implementation(Deps.Timber.core)

    testImplementation(Deps.Test.Spek.core)
    testImplementation(Deps.Test.Spek.runner)
    testImplementation(Deps.Test.MockK.core)
    testImplementation(Deps.Test.Kotlin.core)
    testImplementation(Deps.Test.Kotlin.junit)
    testImplementation(Deps.Test.Kotlin.reflect)
    testImplementation(Deps.Test.JUnit.runner)
    testImplementation(Deps.Test.JUnit.jupiterApi)
    testImplementation(Deps.Test.JUnit.jupiterEngine)
    testImplementation(Deps.Test.JUnit.vintageEngine)
}

kotlin {
    sourceSets.all {
        languageSettings.progressiveMode = true
    }
}