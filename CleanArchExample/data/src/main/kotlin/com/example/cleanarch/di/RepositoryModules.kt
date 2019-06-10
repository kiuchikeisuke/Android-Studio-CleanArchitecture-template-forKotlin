package com.example.cleanarch.di

import dagger.Module

/* module for Repositories */
@Module
abstract class RepositoryModules {
    /*if you add a new datastore & repository, add a new provideMethod. Like this */
//  @Binds abstract fun bindSomeRepository(dataStore: SomeDataStore): SomeRepository
}
