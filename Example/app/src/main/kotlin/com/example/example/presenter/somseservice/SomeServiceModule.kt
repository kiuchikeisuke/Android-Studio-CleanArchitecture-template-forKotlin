package com.example.example.presenter.somseservice

import dagger.Binds
import dagger.Module

@Module
abstract class SomeServiceModule {
    @Binds
    abstract fun bindPresenter(presenter: SomeServicePresenter): SomeServiceContract.Presenter

    /* FIXME MUST add below method to BindingModules */
    // @ContributesAndroidInjector(modules = [SomeServiceModule::class]) abstract fun contributeSomeServiceServiceInjector(): SomeServiceService
}
