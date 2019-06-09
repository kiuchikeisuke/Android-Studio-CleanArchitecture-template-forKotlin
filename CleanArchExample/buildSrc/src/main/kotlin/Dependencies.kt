object Versions {
    const val compileSdk = 28
    const val minSdk = 21
    const val targetSdk = 28
    const val androidGradle = "3.4.1"

    const val kotlin = "1.3.31"

    const val appCompat = "1.0.2"
    const val constraintLayout = "1.1.3"

}

@Suppress("Reformat")
object Deps {
    object GradlePlugin {
        const val android = "com.android.tools.build:gradle:${Versions.androidGradle}"
        const val kotlin = "org.jetbrains.kotlin:kotlin-gradle-plugin:${Versions.kotlin}"
    }

    object Kotlin {
        const val stdlibJdk = "org.jetbrains.kotlin:kotlin-stdlib-jdk7:${Versions.kotlin}"
    }

    object AndroidX {
        const val appCompat = "androidx.appcompat:appcompat:${Versions.appCompat}"
        const val constraintLayout = "androidx.constraintlayout:constraintlayout:${Versions.constraintLayout}"
    }
}