plugins {
    id("com.android.application")
    id("kotlin-android")
    id("kotlin-android-extensions")
}

android {
    compileSdkVersion(Versions.compileSdk)
    defaultConfig {
        minSdkVersion(Versions.minSdk)
        targetSdkVersion(Versions.targetSdk)
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            consumerProguardFile(file("proguard-rules.pro"))
        }
    }

    dataBinding.isEnabled = true

    dexOptions.javaMaxHeapSize = "2g"
}

dependencies {
    implementation(fileTree(mapOf("dir" to "libs", "include" to arrayOf("*.jar"))))
    implementation(Deps.Kotlin.stdlibJdk)
    implementation(Deps.AndroidX.appCompat)
    implementation(Deps.AndroidX.coreKtx)
    implementation(Deps.AndroidX.constraintLayout)

    testImplementation(Deps.Test.JUnit.core)
    androidTestImplementation(Deps.Test.AndroidX.runner)
    androidTestImplementation(Deps.Test.AndroidX.espresso)
}

kotlin {
    sourceSets.all {
        languageSettings.progressiveMode = true
    }
}