package ${packageName}.utils.commons

abstract class InputUseCase<in Q : IUseCase.RequestValue, S : IUseCase.DelegateResponse<IUseCase.NoResponseValue>, T : Throwable>(executionThreads: ExecutionThreads) :
        IoUseCase<Q, IUseCase.NoResponseValue, S, T>(executionThreads)
