package ${packageName}.utils.commons

import dagger.internal.Preconditions
import io.reactivex.Observable
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.disposables.Disposable
import timber.log.Timber

interface IUseCase {
    fun dispose()
    interface RequestValue
    interface ResponseValue
    data class DelegateResponse<in R : ResponseValue>(val next: (R) -> Unit = {}, val error: (Exception) -> Unit = { Timber.e(it) }, val complete: () -> Unit = {})

    enum class NoRequestValue : RequestValue {
        INSTANCE
    }

    enum class NoResponseValue : ResponseValue {
        INSTANCE
    }
}

abstract class UseCase<in Q : IUseCase.RequestValue, R : IUseCase.ResponseValue, S : IUseCase.DelegateResponse<R>, T : Throwable>(private val executionThreads: ExecutionThreads) {

    internal abstract fun process(requestValue: Q): Observable<R>

    protected val disposable: CompositeDisposable = CompositeDisposable()

    @Suppress("UNCHECKED_CAST")
    internal fun execute(
            requestValues: Q,
            delegateResponse: S,
            disposableClear:Boolean = true
    ): Observable<R> {
        if (disposableClear) disposable.clear()
        val observable = process(requestValues)
                .subscribeOn(executionThreads.io())
                .observeOn(executionThreads.ui())

        addDisposable(observable.subscribe(delegateResponse.next, delegateResponse.error as (Throwable) -> Unit, delegateResponse.complete))
        return observable
    }

    fun dispose() {
        if (!disposable.isDisposed) {
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
