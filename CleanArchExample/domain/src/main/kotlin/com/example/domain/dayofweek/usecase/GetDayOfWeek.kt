package com.example.domain.dayofweek.usecase

import com.example.domain.dayofweek.entity.DayOfWeek
import com.example.domain.dayofweek.entity.Language
import com.example.domain.repository.DayOfWeekRepository
import com.example.domain.utils.commons.ExecutionThreads
import com.example.domain.utils.commons.IoUseCase
import io.reactivex.Observable
import javax.inject.Inject

class GetDayOfWeek @Inject constructor(
    private val dayOfWeekRepository: DayOfWeekRepository,
    executionThreads: ExecutionThreads
) :
    IoUseCase<GetDayOfWeek.Request, GetDayOfWeek.Response, Throwable>(executionThreads) {
    override fun execute(requestValue: Request): Observable<Response> {
        return Observable.create {
            try {
                val today = dayOfWeekRepository.getTodaysDayOfWeek()
                val dayOfWeeks = dayOfWeekRepository.getDayOfWeekWords(requestValue.language)
                val word = dayOfWeeks[today] ?: throw IllegalArgumentException()
                it.onNext(Response(language = requestValue.language, dayOfWeek = today, word = word))
                it.onComplete()
            } catch (e: java.lang.IllegalArgumentException) {
                it.onError(e)
            }
        }
    }

    data class Request(val language: Language) : RequestValue
    data class Response(val language: Language, val dayOfWeek: DayOfWeek, val word: String) : ResponseValue
}
