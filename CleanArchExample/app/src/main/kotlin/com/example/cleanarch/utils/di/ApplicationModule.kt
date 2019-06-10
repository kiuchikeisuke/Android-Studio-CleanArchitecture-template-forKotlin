package com.example.cleanarch.utils.di

import android.content.Context
import android.content.SharedPreferences
import com.example.cleanarch.CleanArchApplication
import com.example.cleanarch.R
import com.example.cleanarch.utils.commons.ExecutionThreads
import dagger.Module
import dagger.Provides
import io.reactivex.Scheduler
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers

/* Module for Application */
@Module
class ApplicationModule {
    @Provides
    fun provideContext(application: CleanArchApplication): Context = application

    @Provides
    fun provideSharedPreference(application: CleanArchApplication): SharedPreferences =
        application.getSharedPreferences(application.getString(R.string.app_name), Context.MODE_PRIVATE)

    @Provides
    fun provideExecutionThreads(): ExecutionThreads {
        return object : ExecutionThreads {
            override fun ui(): Scheduler = AndroidSchedulers.mainThread()
            override fun io(): Scheduler = Schedulers.io()
        }
    }
}
