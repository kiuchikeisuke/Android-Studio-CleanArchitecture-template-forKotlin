package com.example.example.presenter.some

import dagger.Subcomponent

@Subcomponent(modules = arrayOf(SomeModule::class))
interface SomeComponent {
    fun inject(fragment: SomeFragment)
}
