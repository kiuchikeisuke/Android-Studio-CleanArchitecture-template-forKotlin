package ${packageName}.utils.commons

import io.reactivex.Observable

abstract class OutputUseCase<R : UseCase.ResponseValue, T : Throwable>(executionThreads: ExecutionThreads)
    : IoUseCase<UseCase.NoRequestValue, R, T>(executionThreads) {
    protected abstract fun execute(): Observable<R>
    override fun execute(requestValue: NoRequestValue): Observable<R> = execute()
    fun execute(next: (R) -> Unit = defaultNext, error: (T) -> Unit = defaultError, complete: () -> Unit = defaultComplete): Observable<R>
            = execute(NoRequestValue.INSTANCE, next, error, complete)
}
