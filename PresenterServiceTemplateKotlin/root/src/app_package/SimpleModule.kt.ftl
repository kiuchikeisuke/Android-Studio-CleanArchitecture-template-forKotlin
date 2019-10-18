package ${packageName}

import dagger.Binds
import dagger.Module

@Module
abstract class ${moduleClassName} {
    @Binds abstract fun bindPresenter(presenter: ${presenterName}): ${contractName}.Presenter
    @Binds abstract fun bind${serviceName}(view: ${serviceName}): ${contractName}.View

    /* FIXME MUST add below method to BindingModules */
    // @ContributesAndroidInjector(modules = [${moduleClassName}::class]) abstract fun contribute${serviceName}Injector(): ${serviceName}
}
