package ${packageName}.utils.commons

import dagger.internal.Preconditions
import io.reactivex.Scheduler
import io.reactivex.disposables.Disposable
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.observers.DisposableObserver



abstract class IoUseCase <in Q: UseCase.RequestValue, R: UseCase.ResponseValue>(private val executionThreads: ExecutionThreads) : UseCase<Q, R>() {
    protected val disposable: CompositeDisposable = CompositeDisposable()

    fun execute(requestValues: Q, observer: DisposableObserver<R>) {
        disposable.clear()
        val observable = execute(requestValues)
                .subscribeOn(executionThreads.io())
                .observeOn(executionThreads.ui())
        addDisposable(observable.subscribeWith(observer))
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
