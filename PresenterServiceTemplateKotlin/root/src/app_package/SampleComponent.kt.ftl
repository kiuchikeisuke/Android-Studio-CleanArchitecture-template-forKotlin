package ${packageName}

import dagger.Subcomponent
import dagger.android.AndroidInjector

//TODO add some child scope
@Subcomponent(modules = arrayOf(${moduleName}::class))
interface ${componentName}:AndroidInjector<${serviceName}> {
    @Subcomponent.Builder abstract class Builder: AndroidInjector.Builder<${serviceName}>()

    /* FIXME 1st:MUST add below method to BindingModules */
//  @Binds @IntoMap @ServiceKey(${serviceName}::class) abstract fun bind${serviceName}(builder: ${componentName}.Builder): AndroidInjector.Factory<out Service>

    /* FIXME 2nd:MUST add below class to BindingModules's arrayOf() */
//  @Module(subcomponents = arrayOf(
//      ${componentName}::class,
//  ))
//  abstract class BindingModules {

}
