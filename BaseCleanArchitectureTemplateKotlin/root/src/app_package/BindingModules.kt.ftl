package ${packageName}

import dagger.Binds
import dagger.Module
import dagger.android.AndroidInjector
import dagger.android.support.FragmentKey
import dagger.multibindings.IntoMap

/* bind modules for Presenter's modules */
@Module(subcomponents = arrayOf(
    /* If you add a new prsenter, add SubComponentClasses. Like this.And if you have no presenter, delete this parenthesis  */
    /* SomeComponent::class */
))
abstract class BindingModules {
    /*If you add a new prsenter(activity, broadcast, service), add a new factoryMethod. Like this */
//    @Binds @IntoMap @FragmentKey(SomeFragment::class) abstract fun bindSomeFragment(builder: SomeComponent.Builder): AndroidInjector.Factory<out Fragment>
//    @Binds @IntoMap @BroadcastReceiverKey(SomeReceiver::class) abstract fun bindSomeReceiver(builder: SomeComponent.Builder): AndroidInjector.Factory<out BroadcastReceiver>
//    @Binds @IntoMap @ServiceKey(SomeService::class) abstract fun bindSomeService(builder: SomeComponent.Builder): AndroidInjector.Factory<out Service>
}
