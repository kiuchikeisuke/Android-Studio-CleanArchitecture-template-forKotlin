package com.example.example.utils.commons

import dagger.internal.Preconditions
import io.reactivex.Scheduler
import io.reactivex.disposables.Disposable
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.observers.DisposableObserver


abstract class IoUseCase<in Q : UseCase.RequestValue, R : UseCase.ResponseValue>(executionThreads: ExecutionThreads) : UseCase<Q, R>() {
    protected val mSubscribeOn: Scheduler = executionThreads.io()
    protected val mObserveOn: Scheduler = executionThreads.ui()
    protected val mDisposable: CompositeDisposable = CompositeDisposable()

    fun execute(requestValues: Q, observer: DisposableObserver<R>) {
        mDisposable.clear()
        val observable = execute(requestValues)
                .subscribeOn(mSubscribeOn)
                .observeOn(mObserveOn)
        addDisposable(observable.subscribeWith(observer))
    }

    fun dispose() {
        if (mDisposable.isDisposed) {
            mDisposable.dispose()
        }
    }

    /**
     * Dispose from current [CompositeDisposable].
     */
    private fun addDisposable(disposable: Disposable) {
        Preconditions.checkNotNull(disposable)
        Preconditions.checkNotNull(mDisposable)
        mDisposable.add(disposable)
    }
}
