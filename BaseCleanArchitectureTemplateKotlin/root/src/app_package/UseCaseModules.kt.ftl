package ${packageName}.domain

import dagger.Binds
import dagger.Module

@Module
abstract class UseCaseModules {
    /* if you add a new useCase, add a new bind as below */
    // @Binds internal abstract fun bindSomeUseCase(someUseCaseImpl: SomeUseCaseImpl): SomeUseCase
}