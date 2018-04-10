package ${packageName}

import dagger.Subcomponent
import dagger.android.AndroidInjector
import ${applicationPackage}.utils.commons.ActivityScope

@ActivityScope
@Subcomponent(modules = arrayOf(${moduleName}::class))
interface ${componentName}:AndroidInjector<${fragmentName}> {
    @Subcomponent.Builder abstract class Builder: AndroidInjector.Builder<${fragmentName}>()

    /* FIXME 1st:MUST add below method to BindingModules */
//  @Binds @IntoMap @FragmentKey(${fragmentName}::class) abstract fun bind${fragmentName}(builder: ${componentName}.Builder): AndroidInjector.Factory<out Fragment>

    /* FIXME 2nd:MUST add below class to BindingModules's arrayOf() */
//  @Module(subcomponents = arrayOf(
//      ${componentName}::class,
//  ))
//  abstract class BindingModules {
}
