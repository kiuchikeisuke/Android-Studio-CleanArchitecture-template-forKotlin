package com.example.example.utils.di

import dagger.Binds
import dagger.Module
import com.example.example.data.datasource.some.SomeDataSource
import com.example.example.data.datasource.some.SomeRepository

/* module for Repositories */
@Module
abstract class RepositoryModules {
    /*if you add a new datasource & repository, add a new provideMethod. Like this */
//  @Binds abstract fun bindSomeDataSource(repository: SomeRepository): SomeDataSource
    @Binds abstract fun bindSomeDataSource(repository: SomeRepository): SomeDataSource
}
