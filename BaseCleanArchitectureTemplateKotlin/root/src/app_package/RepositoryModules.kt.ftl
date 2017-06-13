package ${packageName}.data

import dagger.Module

/* module for Repositories */
@Module
class RepositoryModules {
    /*if you add a new datasource & repository, add a new provideMethod. Like this */
    //@Provides fun provideSomeDataSource(someRepository: SomeRepository): SomeDataSource = someRepository
}
