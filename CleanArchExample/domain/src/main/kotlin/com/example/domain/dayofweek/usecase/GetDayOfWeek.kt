package com.example.domain.dayofweek.usecase

import com.example.domain.dayofweek.entity.DayOfWeek
import com.example.domain.dayofweek.entity.Language
import com.example.domain.repository.DayOfWeekRepository
import com.example.domain.repository.SystemRepository
import com.example.domain.utils.commons.ExecutionThreads
import com.example.domain.utils.commons.IoUseCase
import io.reactivex.Observable
import javax.inject.Inject

class GetDayOfWeek @Inject constructor(
    private val dayOfWeekRepository: DayOfWeekRepository,
    private val systemRepository: SystemRepository,
    executionThreads: ExecutionThreads
) :
    IoUseCase<GetDayOfWeek.Request, GetDayOfWeek.Response, Throwable>(executionThreads) {
    override fun execute(requestValue: Request): Observable<Response> {
        return Observable.create {
            try {
                val dayOfWeekMapper = dayOfWeekRepository.getDayOfWeekMap(requestValue.language)
                val todaysDayOfWeek = systemRepository.getTodaysDayOfWeek()
                val word = dayOfWeekMapper.mapper[todaysDayOfWeek] ?: throw IllegalArgumentException()
                it.onNext(Response(language = requestValue.language, dayOfWeek = todaysDayOfWeek, word = word))
                it.onComplete()
            } catch (e: IllegalArgumentException) {
                it.onError(e)
            }
        }
    }

    data class Request(val language: Language) : RequestValue
    data class Response(val language: Language, val dayOfWeek: DayOfWeek, val word: String) : ResponseValue
}
