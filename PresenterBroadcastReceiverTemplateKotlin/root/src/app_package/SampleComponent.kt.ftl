package ${packageName}

import dagger.Subcomponent
import dagger.android.AndroidInjector

//TODO add some child scope
@Subcomponent(modules = arrayOf(${moduleName}::class))
interface ${componentName} {
    @Subcomponent.Builder abstract class Builder: AndroidInjector.Builder<${receiverName}>()

    /* FIXME 1st:MUST add below method to BindingModules */
//  @Binds @IntoMap @BroadcastReceiverKey(${receiverName}::class) abstract fun bind${receiverName}(builder: ${componentName}.Builder): AndroidInjector.Factory<out BroadcastReceiver>

    /* FIXME 2nd:MUST add below class to BindingModules's arrayOf() */
//  @Module(subcomponents = arrayOf(
//      ${componentName}::class,
//  ))
//  abstract class BindingModules {

}
