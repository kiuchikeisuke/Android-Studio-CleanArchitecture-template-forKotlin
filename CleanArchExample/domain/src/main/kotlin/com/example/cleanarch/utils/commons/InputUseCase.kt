package com.example.cleanarch.utils.commons

abstract class InputUseCase<in Q : UseCase.RequestValue, T : Throwable>(executionThreads: ExecutionThreads) :
    IoUseCase<Q, UseCase.NoResponseValue, T>(executionThreads)
