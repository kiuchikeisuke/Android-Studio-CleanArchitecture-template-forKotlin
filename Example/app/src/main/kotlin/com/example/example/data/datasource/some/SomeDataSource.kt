package com.example.example.data.datasource.some

import io.reactivex.Observable
import com.example.example.data.entity.SomeDataEntity

interface SomeDataSource {
/*    FIXME MUST add below method to RepositoryModules */
//    @Binds abstract fun bindSomeDataSource(repository: SomeRepository):SomeDataSource
      fun getSomeData(inputParam1: Int): Observable<SomeDataEntity>
}
