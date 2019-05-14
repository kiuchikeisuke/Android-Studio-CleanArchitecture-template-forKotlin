package ${packageName}

import javax.inject.Inject

<#if existInput && existOutput>
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.IoUseCase
</#if>
class ${useCaseName} @Inject constructor(executionThreads: ExecutionThreads)
    : IoUseCase<${useCaseName}.Request, ${useCaseName}.Response, Throwable>(executionThreads) {

    data class Request(/* add input data */): RequestValue
    data class Response(/* add output data */): ResponseValue
}
<#elseif !existInput && existOutput>
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.OutputUseCase
</#if>
class ${useCaseName} @Inject constructor(executionThreads: ExecutionThreads)
    : OutputUseCase<${useCaseName}.Response, Throwable>(executionThreads) {

    data class Response(/* add output data */): ResponseValue
}
<#elseif existInput && !existOutput>
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.InputUseCase
</#if>
class ${useCaseName} @Inject constructor(executionThreads: ExecutionThreads)
    : InputUseCase<${useCaseName}.Request, Throwable>(executionThreads) {

    data class Request(/* add input data */): RequestValue
}
<#else>
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.NoIoUseCase
</#if>
class ${useCaseName} @Inject constructor(executionThreads: ExecutionThreads)
    : NoIoUseCase<Throwable>(executionThreads) {

}
</#if>
