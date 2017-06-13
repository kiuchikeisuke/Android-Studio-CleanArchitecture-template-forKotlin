package com.example.example.presenter.some

import dagger.Module
import dagger.Provides

@Module
class SomeModule(val view: SomeContract.View) {
    @Provides fun provideView(): SomeContract.View = view
}
