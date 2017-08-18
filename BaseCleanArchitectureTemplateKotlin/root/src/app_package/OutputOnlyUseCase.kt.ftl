package ${packageName}.utils.commons

import io.reactivex.Observable
import io.reactivex.observers.DisposableObserver

abstract class OutputOnlyUseCase<R: UseCase.ResponseValue>(executionThreads: ExecutionThreads)
    : IoUseCase<UseCase.NoRequestValue, R>(executionThreads) {
    protected abstract fun execute(): Observable<R>
    override fun execute(requestValue: NoRequestValue): Observable<R> = execute()
    fun execute(observer: DisposableObserver<R>) = execute(NoRequestValue.INSTANCE, observer)
}
