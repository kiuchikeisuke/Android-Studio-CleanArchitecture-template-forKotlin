package com.example.cleanarch

import com.example.cleanarch.utils.di.DaggerRootComponent
import com.example.cleanarch.utils.di.applyAutoInjector
import com.jakewharton.threetenabp.AndroidThreeTen
import dagger.android.AndroidInjector
import dagger.android.support.DaggerApplication
import timber.log.Timber

class CleanArchApplication : DaggerApplication() {
    override fun applicationInjector(): AndroidInjector<out DaggerApplication> {
        return DaggerRootComponent.builder().create(this)
    }

    override fun onCreate() {
        super.onCreate()
        if (BuildConfig.DEBUG) {
            Timber.plant(Timber.DebugTree())
        }
        AndroidThreeTen.init(this);
        applyAutoInjector()
    }
}
