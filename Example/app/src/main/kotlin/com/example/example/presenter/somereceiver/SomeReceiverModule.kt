package com.example.example.presenter.somereceiver

import dagger.Binds
import dagger.Module

@Module
abstract class SomeReceiverModule {
    @Binds
    abstract fun bindPresenter(presenter: SomeReceiverPresenter): SomeReceiverContract.Presenter

    /* FIXME MUST add below method to BindingModules */
    // @ContributesAndroidInjector(modules = [SomeReceiverModule::class]) abstract fun contributeSomeReceiverReceiverInjector(): SomeReceiverReceiver
}
