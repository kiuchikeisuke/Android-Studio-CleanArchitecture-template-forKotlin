package ${packageName}

import dagger.Module
import dagger.Provides

@Module
class ${moduleName}(val view: ${contractName}.View) {
    @Provides fun provideView(): ${contractName}.View = view
}
