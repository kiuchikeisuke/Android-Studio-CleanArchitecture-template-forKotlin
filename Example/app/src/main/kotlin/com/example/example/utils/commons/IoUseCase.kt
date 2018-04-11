package com.example.example.utils.commons

import dagger.internal.Preconditions
import io.reactivex.disposables.Disposable
import io.reactivex.disposables.CompositeDisposable


abstract class IoUseCase<in Q : UseCase.RequestValue, R : UseCase.ResponseValue>(private val executionThreads: ExecutionThreads) : UseCase<Q, R>() {
    protected val disposable: CompositeDisposable = CompositeDisposable()

    fun execute(requestValues: Q, next: (R) -> Unit = {}, error: (Throwable) -> Unit = {}, complete: () -> Unit = {}) {
        val observable = execute(requestValues)
                .subscribeOn(executionThreads.io())
                .observeOn(executionThreads.ui())
        addDisposable(observable.subscribe(next, error, complete))
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
