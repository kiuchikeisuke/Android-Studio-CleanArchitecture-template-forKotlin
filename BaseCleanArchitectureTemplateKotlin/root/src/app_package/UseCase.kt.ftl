package ${packageName}.domain.utils.commons

import dagger.internal.Preconditions
import io.reactivex.Observable
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.disposables.Disposable
import timber.log.Timber

/**
 * Use case interface, accessed from the Presentation layer via this interface, in other words, only the objects defined in this interface are visible to the Presentation
 */
interface IUseCase {
    /**
     * Execute RxJava Dispose processing
     */
    fun dispose()

    /**
     * Request parameters
     */
    interface RequestValue

    /**
     * Response parameter
     */
    interface ResponseValue


    /**
     * Delegate object for receiving the processing results performed in the Domain layer in the Presentation layer, which has the same structure as the RxJava response format
     */
    data class DelegateSubscriber<in R : ResponseValue>(val next: (R) -> Unit = {}, val error: (Throwable) -> Unit = { Timber.e(it) }, val complete: () -> Unit = {})

    /**
     * Use this when there is no request parameter
     */
    object NoRequestValue : RequestValue

    /**
     * Use this when there is no response parameter
     */
    object NoResponseValue : ResponseValue
}

/**
 * Express the specific processing of UseCase.
 */
internal interface UseCaseProcess<in Q : IUseCase.RequestValue, R : IUseCase.ResponseValue> {
    fun execProcess(requestValue: Q): Observable<R>
}

internal abstract class UseCaseHelper<in Q : IUseCase.RequestValue, R : IUseCase.ResponseValue, in S : UseCaseProcess<Q, R>, in T : IUseCase.DelegateSubscriber<R>>(private val executionThreads: ExecutionThreads) {

    protected val disposable: CompositeDisposable = CompositeDisposable()

    /**
     * @param requestValue: requestParams
     * @param delegateSubscriber: Delegate object for receiving the result of processing performed in the Domain layer in the Presentation layer
     * @param process: Specific processing contents, scope is only Domain layer
     * @param disposableClear: Whether to clear the previous process if the previous process still remains when the same UseCase is executed, default is false and not cleared
     */
    @Suppress("UNCHECKED_CAST")
    internal fun execute(
            requestValue: Q,
            delegateSubscriber: T,
            process: S,
            disposableClear: Boolean = false
    ): Observable<R> {
        if (disposableClear) disposable.clear()
        val observable = process.execProcess(requestValue)
                .subscribeOn(executionThreads.io())
                .observeOn(executionThreads.ui())

        addDisposable(observable.subscribe(delegateSubscriber.next, delegateSubscriber.error as (Throwable) -> Unit, delegateSubscriber.complete))
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