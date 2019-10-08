package ${packageName}

import io.reactivex.Observable
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.IUseCase
import ${applicationPackage}.utils.commons.UseCaseHelper
import ${applicationPackage}.utils.commons.UseCaseProcess
</#if>
import javax.inject.Inject

<#if existInput && existOutput>
internal class ${useCaseName}Impl @Inject constructor(executionThreads: ExecutionThreads)
    : UseCaseHelper<${useCaseName}.Request, ${useCaseName}.Response, ${useCaseName}Impl.ProcessImpl, IUseCase.DelegateSubscriber<${useCaseName}.Response>, Throwable>(executionThreads), ${useCaseName} {

    override fun exec(request: ${useCaseName}.Request, delegateSubscriber: IUseCase.DelegateSubscriber<${useCaseName}.Response>)
      : Observable<${useCaseName}.Response> = execute(request, delegateSubscriber, ProcessImpl())

    inner class ProcessImpl : UseCaseProcess<${useCaseName}.Request, ${useCaseName}.Response> {
        override fun execProcess(requestValue: ${useCaseName}.Request): Observable<${useCaseName}.Response> {
            /* add logic here !!*/
        }
    }
}

// FIXME !! add following sourceCode to UseCaseModules
// @Binds internal abstract fun bind${useCaseName}(usecaseImpl: ${useCaseName}Impl): ${useCaseName}

interface ${useCaseName} : IUseCase {
    fun exec(request: Request, delegateSubscriber: IUseCase.DelegateSubscriber<Response>): Observable<Response>
    data class Request(/* add input data */): IUseCase.RequestValue
    data class Response(/* add output data */): IUseCase.ResponseValue
}
<#elseif !existInput && existOutput>
internal class ${useCaseName}Impl @Inject constructor(executionThreads: ExecutionThreads)
    : UseCaseHelper<IUseCase.NoRequestValue, ${useCaseName}.Response, ${useCaseName}Impl.ProcessImpl, IUseCase.DelegateSubscriber<${useCaseName}.Response>, Throwable>(executionThreads), ${useCaseName} {

    override fun exec(delegateSubscriber: IUseCase.DelegateSubscriber<${useCaseName}.Response>)
      : Observable<${useCaseName}.Response> = execute(IUseCase.NoRequestValue.INSTANCE, delegateSubscriber, ProcessImpl())

    inner class ProcessImpl : UseCaseProcess<IUseCase.NoRequestValue, ${useCaseName}.Response> {
        override fun execProcess(requestValue: IUseCase.NoRequestValue): Observable<${useCaseName}.Response> {
            /* add logic here !!*/
        }
    }
}

// FIXME !! add following sourceCode to UseCaseModules
// @Binds internal abstract fun bind${useCaseName}(usecaseImpl: ${useCaseName}Impl): ${useCaseName}

interface ${useCaseName} : IUseCase {
    fun exec(delegateSubscriber: IUseCase.DelegateSubscriber<Response>): Observable<Response>
    data class Response(/* add output data */): IUseCase.ResponseValue
}
<#elseif existInput && !existOutput>
internal class ${useCaseName}Impl @Inject constructor(executionThreads: ExecutionThreads)
    : UseCaseHelper<${useCaseName}.Request, IUseCase.NoResponseValue, ${useCaseName}Impl.ProcessImpl, IUseCase.DelegateSubscriber<IUseCase.NoResponseValue>, Throwable>(executionThreads), ${useCaseName} {

    override fun exec(request: ${useCaseName}.Request, delegateSubscriber: IUseCase.DelegateSubscriber<IUseCase.NoResponseValue>)
      : Observable<IUseCase.NoResponseValue> = execute(request, delegateSubscriber, ProcessImpl())

    inner class ProcessImpl : UseCaseProcess<${useCaseName}.Request, IUseCase.NoResponseValue> {
        override fun execProcess(requestValue: ${useCaseName}.Request): Observable<IUseCase.NoResponseValue> {
            /* add logic here !!*/
        }
    }
}

// FIXME !! add following sourceCode to UseCaseModules
// @Binds internal abstract fun bind${useCaseName}(usecaseImpl: ${useCaseName}Impl): ${useCaseName}

interface ${useCaseName} : IUseCase {
    fun exec(request: Request, delegateSubscriber: IUseCase.DelegateSubscriber<IUseCase.NoResponseValue>): Observable<IUseCase.NoResponseValue>
    data class Request(/* add input data */): IUseCase.RequestValue
}
<#else>
internal class ${useCaseName}Impl @Inject constructor(executionThreads: ExecutionThreads)
    : UseCaseHelper<IUseCase.NoRequestValue, IUseCase.NoResponseValue, ${useCaseName}Impl.ProcessImpl, IUseCase.DelegateSubscriber<IUseCase.NoResponseValue>, Throwable>(executionThreads), ${useCaseName} {

    override fun exec(delegateSubscriber: IUseCase.DelegateSubscriber<IUseCase.NoResponseValue>)
      : Observable<IUseCase.NoResponseValue> = execute(IUseCase.NoRequestValue.INSTANCE, delegateSubscriber, ProcessImpl())

    inner class ProcessImpl : UseCaseProcess<IUseCase.NoRequestValue, IUseCase.NoResponseValue> {
        override fun execProcess(requestValue: IUseCase.NoRequestValue): Observable<IUseCase.NoResponseValue> {
            /* add logic here !!*/
        }
    }
}

// FIXME !! add following sourceCode to UseCaseModules
// @Binds internal abstract fun bind${useCaseName}(usecaseImpl: ${useCaseName}Impl): ${useCaseName}

interface ${useCaseName} : IUseCase {
    fun exec(delegateSubscriber: IUseCase.DelegateSubscriber<IUseCase.NoResponseValue>): Observable<IUseCase.NoResponseValue>
}
</#if>
