package com.example.example.domain.some

import io.reactivex.Observable
import com.example.example.data.datasource.some.SomeDataSource
import com.example.example.data.entity.SomeDataEntity
import javax.inject.Inject

import com.example.example.utils.commons.ExecutionThreads
import com.example.example.utils.commons.IoUseCase
import com.example.example.utils.commons.UseCase

class GetSomeData @Inject constructor(private val someDataSource: SomeDataSource, executionThreads: ExecutionThreads)
    : IoUseCase<GetSomeData.Request, GetSomeData.Response, Throwable>(executionThreads) {


    override fun execute(requestValue: Request): Observable<Response> {
        return someDataSource.getSomeData(requestValue.inputParam).map { t -> Response(t) }
    }

    data class Request(val inputParam:Int) : UseCase.RequestValue
    data class Response(val someDataEntity: SomeDataEntity) : UseCase.ResponseValue
}

