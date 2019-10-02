package ${packageName}.utils.commons
import io.reactivex.Observable

abstract class NoIoUseCase<S : IUseCase.DelegateResponse<IUseCase.NoResponseValue>, T : Throwable>(executionThreads: ExecutionThreads) :
        IoUseCase<IUseCase.NoRequestValue, IUseCase.NoResponseValue, S, T>(executionThreads) {
    protected abstract fun process(): Observable<IUseCase.NoResponseValue>
    override fun process(requestValue: IUseCase.NoRequestValue): Observable<IUseCase.NoResponseValue> = process()
}

