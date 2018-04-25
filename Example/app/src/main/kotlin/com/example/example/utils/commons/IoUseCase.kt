package com.example.example.utils.commons

import dagger.internal.Preconditions
import io.reactivex.disposables.Disposable
import io.reactivex.disposables.CompositeDisposable


abstract class IoUseCase<in Q : UseCase.RequestValue, R : UseCase.ResponseValue, T : Throwable>(private val executionThreads: ExecutionThreads) : UseCase<Q, R>() {
    private val disposable: CompositeDisposable = CompositeDisposable()

    @Suppress("UNCHECKED_CAST")
    fun execute(requestValues: Q, next: (R) -> Unit = {}, error: (T) -> Unit = {}, complete: () -> Unit = {}) {
        disposable.clear()
        val observable = execute(requestValues)
                .subscribeOn(executionThreads.io())

        addDisposable(observable.subscribe(next, error as (Throwable) -> Unit, complete))
    }

    fun dispose() {
        if (disposable.isDisposed) {
            disposable.dispose()
        }
    }

    /**
     * Dispose from current [CompositeDisposable].
     */
    private fun addDisposable(disposable: Disposable) {
        Preconditions.checkNotNull(disposable)
        Preconditions.checkNotNull(this.disposable)
        this.disposable.add(disposable)
    }
}
