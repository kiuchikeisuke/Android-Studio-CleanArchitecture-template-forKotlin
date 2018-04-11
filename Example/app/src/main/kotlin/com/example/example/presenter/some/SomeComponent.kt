package com.example.example.presenter.some

import com.example.example.utils.commons.ActivityScope
import dagger.Subcomponent
import dagger.android.AndroidInjector

@ActivityScope
@Subcomponent(modules = arrayOf(SomeModule::class))
interface SomeComponent : AndroidInjector<SomeFragment> {
    @Subcomponent.Builder abstract class Builder : AndroidInjector.Builder<SomeFragment>()

    /* FIXME 1st:MUST add below method to BindingModules */
    // @Binds @IntoMap @FragmentKey(SomeFragment::class) abstract fun bindSomeFragment(builder: SomeComponent.Builder): AndroidInjector.Factory<out Fragment>

    /* FIXME 2nd:MUST add below class to BindingModules's arrayOf() */
    //@Module(subcomponents = arrayOf(
    //    SomeComponent::class,
    //))
    //abstract class BindingModules {
}
