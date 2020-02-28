package ${packageName}.data

import dagger.Module

/* module for Repositories */
@Module
abstract class RepositoryModules {
    /*if you add a new datastore & repository, add a new provideMethod. Like this */
//  @Binds abstract fun bindSomeRepository(dataStore: SomeDataStore): SomeRepository
}
