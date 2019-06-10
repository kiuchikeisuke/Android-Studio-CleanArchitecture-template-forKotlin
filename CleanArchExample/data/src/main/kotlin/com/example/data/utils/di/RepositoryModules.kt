package com.example.data.utils.di

import com.example.data.datasource.dayofweek.DayOfWeekDataStore
import com.example.domain.repository.DayOfWeekRepository
import dagger.Binds
import dagger.Module

/* module for Repositories */
@Module
abstract class RepositoryModules {
    /*if you add a new datastore & repository, add a new provideMethod. Like this */
//  @Binds abstract fun bindSomeRepository(dataStore: SomeDataStore): SomeRepository
    @Binds
    abstract fun bindDayOfWeekRepository(dataStore: DayOfWeekDataStore): DayOfWeekRepository
}
