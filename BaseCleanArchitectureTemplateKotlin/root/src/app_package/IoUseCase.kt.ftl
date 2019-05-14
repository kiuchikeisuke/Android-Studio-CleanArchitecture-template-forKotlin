package ${packageName}.utils.commons

abstract class IoUseCase<in Q : UseCase.RequestValue, R : UseCase.ResponseValue, T : Throwable>(executionThreads: ExecutionThreads) :
        UseCase<Q, R, T>(executionThreads)