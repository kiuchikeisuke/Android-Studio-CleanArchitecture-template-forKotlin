package ${packageName}.utils.commons

abstract class IoUseCase<in Q : IUseCase.RequestValue, R : IUseCase.ResponseValue, S : IUseCase.DelegateResponse<R>, T : Throwable>(executionThreads: ExecutionThreads) :
        UseCase<Q, R, S, T>(executionThreads)