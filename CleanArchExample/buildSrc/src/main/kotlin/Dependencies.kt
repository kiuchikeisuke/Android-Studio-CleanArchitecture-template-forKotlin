object Versions {
    const val compileSdk = 28
    const val minSdk = 21
    const val targetSdk = 28
}

@Suppress("Reformat")
object Deps {
    object Kotlin {
        const val version = "1.3.31"
        const val stdlibJdk = "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$version"
    }

    object AndroidX {
        private const val coreVersion = "1.0.2"
        const val appCompat = "androidx.appcompat:appcompat:$coreVersion"
        const val coreKtx = "androidx.core:core-ktx:$coreVersion"
        const val constraintLayout = "androidx.constraintlayout:constraintlayout:1.1.3"
    }

    object Dagger {
        private const val version = "2.20"
        const val compiler = "com.google.dagger:dagger-compiler:$version"
        const val processor = "com.google.dagger:dagger-android-processor:$version"
        const val core = "com.google.dagger:dagger:$version"
        const val android = "com.google.dagger:dagger-android:$version"
        const val androidSupport = "com.google.dagger:dagger-android-support:$version"
    }

    object RxJava {
        const val core = "io.reactivex.rxjava2:rxjava:2.2.4"
        const val kotlin = "io.reactivex.rxjava2:rxkotlin:2.3.0"
        const val android = "io.reactivex.rxjava2:rxandroid:2.0.1"
    }

    object Timber {
        const val core = "com.jakewharton.timber:timber:4.7.1"
    }

    object Test {
        object Spek {
            private const val version = "2.0.4"
            const val core = "org.spekframework.spek2:spek-dsl-jvm:$version"
            const val runner = "org.spekframework.spek2:spek-runner-junit5:$version"

        }

        object MockK {
            const val core = "io.mockk:mockk:1.9.2.kotlin12"
        }

        object Kotlin {
            const val core = "org.jetbrains.kotlin:kotlin-test:${Deps.Kotlin.version}"
            const val junit = "org.jetbrains.kotlin:kotlin-test-junit:${Deps.Kotlin.version}"
            const val reflect = "org.jetbrains.kotlin:kotlin-reflect:${Deps.Kotlin.version}"
        }

        object JUnit {
            private const val jupiterVersion = "5.3.1"
            const val core = "junit:junit:4.12"
            const val runner = "org.junit.platform:junit-platform-runner:1.1.0"
            const val vintageEngine = "org.junit.vintage:junit-vintage-engine:5.2.0"
            const val jupiterApi = "org.junit.jupiter:junit-jupiter-api:$jupiterVersion"
            const val jupiterEngine = "org.junit.jupiter:junit-jupiter-engine:$jupiterVersion"
        }

        object AndroidX {
            const val runner = "androidx.test:runner:1.2.0"
            const val espresso = "androidx.test.espresso:espresso-core:3.2.0"
        }
    }
}