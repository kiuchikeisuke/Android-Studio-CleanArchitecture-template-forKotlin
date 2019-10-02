package ${packageName}.utils.commons

import io.reactivex.Observable

abstract class OutputUseCase<R : IUseCase.ResponseValue, S : IUseCase.DelegateResponse<R>, T : Throwable>(executionThreads: ExecutionThreads) :
        IoUseCase<IUseCase.NoRequestValue, R, S, T>(executionThreads) {
    protected abstract fun process(): Observable<R>
    override fun process(requestValue: IUseCase.NoRequestValue): Observable<R> = process()
    fun execute(delegateResponse: S
    ): Observable<R> = execute(IUseCase.NoRequestValue.INSTANCE, delegateResponse)
}

