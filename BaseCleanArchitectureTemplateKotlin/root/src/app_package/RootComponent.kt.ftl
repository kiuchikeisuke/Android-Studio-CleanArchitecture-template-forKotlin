package ${packageName}

import dagger.Component
import dagger.android.AndroidInjector
import dagger.android.support.AndroidSupportInjectionModule
import ${packageName}.${appClassName}.data.ApiModules
import ${packageName}.${appClassName}.data.RepositoryModules
import ${packageName}.${appClassName}.domain.UseCaseModules
import ${packageName}.${appClassName}.presenter.BindingModules
import javax.inject.Singleton

@Singleton
@Component(modules = [
        AndroidSupportInjectionModule::class,
        ApplicationModule::class,
        RepositoryModules::class,
        ApiModules::class,
        UseCaseModules::class,
        BindingModules::class])
interface RootComponent:AndroidInjector<${appClassName}> {
    @Component.Builder
    abstract class Builder:AndroidInjector.Builder<${appClassName}>()
}
