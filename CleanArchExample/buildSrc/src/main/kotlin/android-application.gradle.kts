plugins {
    id("com.android.application")
    id("kotlin-android")
    id("kotlin-android-extensions")
    id("kotlin-kapt")
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

    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
        getByName("test").java.srcDirs("src/test/kotlin")
        getByName("androidTest").java.srcDirs("src/androidTest/kotlin")
    }

    dataBinding.isEnabled = true

    dexOptions.javaMaxHeapSize = "2g"
}

dependencies {
    implementation(fileTree(mapOf("dir" to "libs", "include" to arrayOf("*.jar"))))
    implementation(Deps.Kotlin.stdlibJdk)
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


    testImplementation(Deps.Test.JUnit.core)
    androidTestImplementation(Deps.Test.AndroidX.runner)
    androidTestImplementation(Deps.Test.AndroidX.espresso)
    debugImplementation(Deps.Leakanary.core)
}

kotlin {
    sourceSets.all {
        languageSettings.progressiveMode = true
    }
}