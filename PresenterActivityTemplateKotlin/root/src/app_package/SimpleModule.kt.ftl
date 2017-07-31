package ${packageName}

import dagger.Binds
import dagger.Module

@Module
abstract class ${moduleName} {
    @Binds abstract fun bindView(fragment: ${fragmentName}): ${contractName}.View
    @Binds abstract fun bindPresenter(presenter: ${presenterName}): ${contractName}.Presenter
}
