package ${packageName}

import dagger.Binds
import dagger.Module
import dagger.android.ContributesAndroidInjector
import dagger.multibindings.IntoMap

@Module
abstract class ${moduleClassName} {
    @Binds abstract fun bind${presenterName}(presenter: ${presenterName}): ${contractName}.Presenter
    @Binds abstract fun bind${fragmentName}(view: ${fragmentName}): ${contractName}.View

    /* FIXME MUST add below method to BindingModules */
    // @ContributesAndroidInjector(modules = [${moduleClassName}::class]) @ActivityScope abstract fun contribute${activityClass}Injector(): ${activityClass}
}
