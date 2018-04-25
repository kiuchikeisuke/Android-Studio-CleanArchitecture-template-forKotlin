package com.example.example.utils.commons

abstract class InputOnlyUseCase<in Q : UseCase.RequestValue, T : Throwable>(executionThreads: ExecutionThreads)
    : IoUseCase<Q, UseCase.NoResponseValue, T>(executionThreads)
