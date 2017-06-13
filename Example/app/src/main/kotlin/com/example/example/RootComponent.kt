package com.example.example

import android.content.Context
import com.example.example.data.RepositoryModules
import com.example.example.presenter.some.SomeComponent
import com.example.example.presenter.some.SomeModule
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = arrayOf(ApplicationModule::class, RepositoryModules::class, ApiModules::class))
interface RootComponent {
    val context: Context

    /*TODO if you add a new presenter's component, add a new NewComponentMethod like this!! */
    //fun newSomeComponent(someModule: SomeModule): SomeComponent
    fun newSomeComponent(module: SomeModule): SomeComponent
}
