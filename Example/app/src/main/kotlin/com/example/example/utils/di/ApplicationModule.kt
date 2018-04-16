package com.example.example.utils.di

import android.content.Context
import android.content.SharedPreferences
import com.example.example.BuildConfig
import com.example.example.MainApplication
import com.example.example.R
import com.example.example.utils.commons.ExecutionThreads
import dagger.Module
import dagger.Provides
import io.reactivex.Scheduler
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import io.realm.Realm
import io.realm.RealmConfiguration

/* Module for Application */
@Module
class ApplicationModule {
    @Provides fun provideContext(application: MainApplication): Context = application
    @Provides fun provideSharedPreference(application: MainApplication): SharedPreferences = application.getSharedPreferences(application.getString(R.string.app_name), Context.MODE_PRIVATE)

    @Provides
    fun provideRealm(application: MainApplication): Realm {
        val builder = RealmConfiguration.Builder().name(application.getString(R.string.app_name))
        return if (BuildConfig.DEBUG) {
            Realm.getInstance(builder.deleteRealmIfMigrationNeeded().build())
        } else {
            Realm.getInstance(builder.build())
        }
    }

    @Provides
    fun provideExecutionThreads(): ExecutionThreads {
        return object : ExecutionThreads {
            override fun ui(): Scheduler = AndroidSchedulers.mainThread()
            override fun io(): Scheduler = Schedulers.io()
        }
    }
}
