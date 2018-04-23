package ${packageName}.utils.di

import dagger.Component
import dagger.android.AndroidInjector
import dagger.android.support.AndroidSupportInjectionModule
import ${packageName}.${appClassName}
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
