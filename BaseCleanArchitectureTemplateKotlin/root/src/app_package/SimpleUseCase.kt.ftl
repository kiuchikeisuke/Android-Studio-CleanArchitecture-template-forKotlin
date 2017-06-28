package ${packageName}.utils.commons

abstract class SimpleUseCase(executionThreads: ExecutionThreads) : IoUseCase<UseCase.NoRequestValue, UseCase.NoResponseValue>(executionThreads) {
    protected abstract fun execute(): Observable<NoResponseValue>
    override fun execute(requestValue: NoRequestValue): Observable<NoResponseValue> = execute()
}
