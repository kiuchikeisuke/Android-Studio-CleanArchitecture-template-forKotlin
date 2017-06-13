package com.example.example.utils.commons

import io.reactivex.Observable


abstract class UseCase<in Q : UseCase.RequestValue, R : UseCase.ResponseValue> {

    protected abstract fun execute(requestValue: Q): Observable<R>

    interface RequestValue
    interface ResponseValue
    enum class NoRequestValue : RequestValue {
        INSTANCE
    }

    enum class NoResponseValue : ResponseValue {
        INSTANCE
    }
}
