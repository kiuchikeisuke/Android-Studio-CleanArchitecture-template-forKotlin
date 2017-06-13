package ${packageName}

import dagger.Subcomponent

@Subcomponent(modules = arrayOf(${moduleName}::class))
interface ${componentName} {
    fun inject(fragment: ${fragmentName})
}
