package com.example.example.data.datasource.some

import com.example.example.data.entity.SomeDataEntity
import io.reactivex.Observable

interface SomeDataSource {
/*    FIXME MUST add below method to RepositoryModules */
//    @Provides fun provideSomeDataSource(repository: SomeRepository): SomeDataSource = repository
    fun getSomeData(inputParam1: Int): io.reactivex.Observable<SomeDataEntity>
}
