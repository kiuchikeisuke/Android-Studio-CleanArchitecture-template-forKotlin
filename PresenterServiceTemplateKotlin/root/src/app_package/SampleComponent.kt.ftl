package ${packageName}

import dagger.Subcomponent

//TODO add some child scope
@Subcomponent(modules = arrayOf(${moduleName}::class))
interface ${componentName} {
    fun inject(service: ${serviceName})
}
