package ${packageName}.utils.commons
import io.reactivex.Observable

abstract class NoIoUseCase<T : Throwable>(executionThreads: ExecutionThreads) : IoUseCase<UseCase.NoRequestValue, UseCase.NoResponseValue, T>(executionThreads) {
    protected abstract fun execute(): Observable<NoResponseValue>
    override fun execute(requestValue: NoRequestValue): Observable<NoResponseValue> = execute()
}
