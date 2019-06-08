plugins {
    id("com.android.application")
    id("kotlin-android")
    id("kotlin-android-extensions")
}

kotlin {
    sourceSets.all {
        languageSettings.progressiveMode = true
    }
}