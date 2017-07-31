package com.example.example.data.datasource.some

import io.reactivex.Observable
import com.example.example.data.entity.SomeDataEntity
import javax.inject.Inject

class SomeRepository @Inject constructor() : SomeDataSource {
    override fun getSomeData(inputParam1: Int): Observable<SomeDataEntity> {
        return Observable.create { e ->
            if (inputParam1 > 0) {
                e.onNext(SomeDataEntity("input 1", 1))
            } else {
                e.onNext(SomeDataEntity("input 0", 0))
            }
            e.onComplete()
        }
    }
}
