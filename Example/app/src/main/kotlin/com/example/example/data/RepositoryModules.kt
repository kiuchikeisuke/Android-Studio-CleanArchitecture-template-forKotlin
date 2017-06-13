package com.example.example.data

import com.example.example.data.datasource.some.SomeDataSource
import com.example.example.data.datasource.some.SomeRepository
import dagger.Module
import dagger.Provides

/* module for Repositories */
@Module
class RepositoryModules {
    /*if you add a new datasource & repository, add a new provideMethod. Like this */
    //@Provides fun provideSomeDataSource(someRepository: SomeRepository): SomeDataSource = someRepository
    @Provides fun provideSomeDataSource(repository: SomeRepository): SomeDataSource = repository
}
