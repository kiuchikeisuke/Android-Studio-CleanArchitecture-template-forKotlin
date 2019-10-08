package ${packageName}

import dagger.Binds
import dagger.Module

@Module
abstract class ${moduleName} {
    @Binds abstract fun bindPresenter(presenter: ${presenterName}): ${contractName}.Presenter
    @Binds abstract fun bind${receiverName}(view: ${receiverName}): ${contractName}.View

    /* FIXME MUST add below method to BindingModules */
    // @ContributesAndroidInjector(modules = [${moduleName}::class]) abstract fun contribute${receiverName}Injector(): ${receiverName}
}
