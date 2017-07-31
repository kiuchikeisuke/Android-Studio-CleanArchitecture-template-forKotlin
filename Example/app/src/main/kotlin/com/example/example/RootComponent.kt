package com.example.example

import com.example.example.data.RepositoryModules
import dagger.Component
import dagger.android.AndroidInjector
import dagger.android.support.AndroidSupportInjectionModule
import javax.inject.Singleton

@Singleton
@Component(modules = arrayOf(
        AndroidSupportInjectionModule::class,
        ApplicationModule::class,
        RepositoryModules::class,
        ApiModules::class,
        BindingModules::class))
interface RootComponent : AndroidInjector<MainApplication> {
    @Component.Builder
    abstract class Builder : AndroidInjector.Builder<MainApplication>()
}
