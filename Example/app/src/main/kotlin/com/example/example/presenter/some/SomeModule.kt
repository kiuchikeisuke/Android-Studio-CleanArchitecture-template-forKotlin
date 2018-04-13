package com.example.example.presenter.some

import android.arch.lifecycle.ViewModel
import com.example.example.utils.annotations.ViewModelKey
import dagger.Binds
import dagger.Module
import dagger.android.ContributesAndroidInjector
import dagger.multibindings.IntoMap

@Module
abstract class SomeModule {
    @Binds @IntoMap @ViewModelKey(SomePresenterViewModel::class) abstract fun bindSomePresenterViewModel(viewModel: SomePresenterViewModel): ViewModel
    @ContributesAndroidInjector abstract fun contributeSomeFragment():SomeFragment

    /* FIXME MUST add below method to BindingModules */
    // @ContributesAndroidInjector(modules = [SomeModule::class]) @ActivityScope abstract fun contributeSomeActivityInjector(): SomeActivity
}
