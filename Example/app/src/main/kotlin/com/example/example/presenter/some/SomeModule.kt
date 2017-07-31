package com.example.example.presenter.some

import dagger.Binds
import dagger.Module

@Module
abstract class SomeModule {
    @Binds abstract fun bindView(fragment: SomeFragment): SomeContract.View
    @Binds abstract fun bindPresenter(presenter: SomePresenter): SomeContract.Presenter
}
