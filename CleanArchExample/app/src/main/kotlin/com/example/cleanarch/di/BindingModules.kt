package com.example.cleanarch.di

import androidx.lifecycle.ViewModelProvider
import com.example.presentation.presenter.main.CleanArchMainActivity
import com.example.presentation.presenter.main.CleanArchMainModule
import com.example.presentation.utils.annotations.ActivityScope
import com.example.presentation.utils.di.ViewModelFactory
import dagger.Binds
import dagger.Module
import dagger.android.ContributesAndroidInjector

/* bind modules for Presenter's modules */
@Module
internal abstract class BindingModules {
    @Binds
    abstract fun bindViewModelFactory(factory: ViewModelFactory): ViewModelProvider.Factory

    /*If you add a new presenter(activity, broadcast, service), add a new contributeMethod. For detail, refer to FIXME of each presenter's module */
    @ContributesAndroidInjector(modules = [CleanArchMainModule::class])
    @ActivityScope
    abstract fun contributeCleanArchMainActivityInjector(): CleanArchMainActivity
}
