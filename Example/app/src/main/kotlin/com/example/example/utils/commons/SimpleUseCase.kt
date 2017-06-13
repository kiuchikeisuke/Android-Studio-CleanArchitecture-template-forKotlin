package com.example.example.utils.commons

abstract class SimpleUseCase(executionThreads: ExecutionThreads) : IoUseCase<UseCase.NoRequestValue, UseCase.NoResponseValue>(executionThreads)
