package com.example.cleanarch.utils.di

import com.example.cleanarch.CleanArchApplication
import com.example.cleanarch.di.ApiModules
import com.example.cleanarch.di.RepositoryModules
import dagger.Component
import dagger.android.AndroidInjector
import dagger.android.support.AndroidSupportInjectionModule
import javax.inject.Singleton

@Singleton
@Component(
    modules = [
        AndroidSupportInjectionModule::class,
        ApplicationModule::class,
        RepositoryModules::class,
        ApiModules::class,
        BindingModules::class]
)
interface RootComponent : AndroidInjector<CleanArchApplication> {
    @Component.Builder
    abstract class Builder : AndroidInjector.Builder<CleanArchApplication>()
}
