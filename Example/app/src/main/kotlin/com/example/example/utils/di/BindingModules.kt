package com.example.example.utils.di

import android.arch.lifecycle.ViewModelProvider
import com.example.example.presenter.some.SomeActivity
import com.example.example.presenter.some.SomeModule
import com.example.example.presenter.somereceiver.SomeReceiverModule
import com.example.example.presenter.somereceiver.SomeReceiverReceiver
import com.example.example.presenter.somseservice.SomeServiceModule
import com.example.example.presenter.somseservice.SomeServiceService
import com.example.example.utils.annotations.ActivityScope
import dagger.Binds
import dagger.Module
import dagger.android.ContributesAndroidInjector

@Module
internal abstract class BindingModules {
    @Binds abstract fun bindViewModelFactory(factory: ViewModelFactory): ViewModelProvider.Factory

    /*If you add a new presenter(activity, broadcast, service), add a new contributeMethod. For detail, refer to FIXME of each presenter's module */
    @ContributesAndroidInjector(modules = [SomeModule::class]) @ActivityScope abstract fun contributeSomeActivityInjector(): SomeActivity
    @ContributesAndroidInjector(modules = [SomeServiceModule::class]) abstract fun contributeSomeServiceServiceInjector(): SomeServiceService
    @ContributesAndroidInjector(modules = [SomeReceiverModule::class]) abstract fun contributeSomeReceiverReceiverInjector(): SomeReceiverReceiver
}
