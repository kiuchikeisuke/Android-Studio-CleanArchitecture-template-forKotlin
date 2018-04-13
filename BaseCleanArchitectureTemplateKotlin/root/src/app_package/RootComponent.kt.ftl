package ${packageName}.utils.di

import ${packageName}.data.RepositoryModules
import dagger.Component
import dagger.android.AndroidInjector
import dagger.android.support.AndroidSupportInjectionModule
import javax.inject.Singleton

@Singleton
@Component(modules = [
        AndroidSupportInjectionModule::class,
        ApplicationModule::class,
        RepositoryModules::class,
        ApiModules::class,
        BindingModules::class])
interface RootComponent:AndroidInjector<${appClassName}> {
    @Component.Builder
    abstract class Builder:AndroidInjector.Builder<${appClassName}>()
}
