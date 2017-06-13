package com.example.example.utils.commons

import io.reactivex.Observable

abstract class OutputOnlyUseCase<R : UseCase.ResponseValue>(executionThreads: ExecutionThreads)
    : IoUseCase<UseCase.NoRequestValue, R>(executionThreads) {
    protected abstract fun execute(): Observable<R>
    override fun execute(requestValue: NoRequestValue): Observable<R> = execute()
}
