package com.example.domain.dayofweek.usecase

import com.example.domain.dayofweek.entity.DayOfWeek
import com.example.domain.dayofweek.entity.DayOfWeekMapper
import com.example.domain.dayofweek.entity.Language
import com.example.domain.repository.DayOfWeekRepository
import com.example.domain.repository.SystemRepository
import com.example.domain.utils.commons.ExecutionThreads
import io.mockk.every
import io.mockk.mockk
import io.mockk.spyk
import io.reactivex.schedulers.Schedulers
import org.spekframework.spek2.Spek
import org.spekframework.spek2.style.specification.describe

internal object GetDayOfWeekTest : Spek({
    val executionThreads = spyk<ExecutionThreads>()
    val systemRepository = spyk<SystemRepository>()
    val dayOfWeekRepository = spyk<DayOfWeekRepository>()
    val langTypeMockA = mockk<Language>()
    val langTypeMockB = mockk<Language>()
    val dayOfWeekMock = mockk<DayOfWeek>()
    every { executionThreads.io() } returns Schedulers.trampoline()
    every { executionThreads.ui() } returns Schedulers.trampoline()
    every { dayOfWeekRepository.getDayOfWeekMap(langTypeMockA) } returns DayOfWeekMapper(
        mapOf(
            Pair(DayOfWeek.SUNDAY, "A1"),
            Pair(DayOfWeek.MONDAY, "A2"),
            Pair(DayOfWeek.TUESDAY, "A3"),
            Pair(DayOfWeek.WEDNESDAY, "A4"),
            Pair(DayOfWeek.THURSDAY, "A5"),
            Pair(DayOfWeek.FRIDAY, "A6"),
            Pair(DayOfWeek.SATURDAY, "A7")
        )
    )
    every { dayOfWeekRepository.getDayOfWeekMap(langTypeMockB) } returns DayOfWeekMapper(
        mapOf(
            Pair(DayOfWeek.SUNDAY, "B1"),
            Pair(DayOfWeek.MONDAY, "B2"),
            Pair(DayOfWeek.TUESDAY, "B3"),
            Pair(DayOfWeek.WEDNESDAY, "B4"),
            Pair(DayOfWeek.THURSDAY, "B5"),
            Pair(DayOfWeek.FRIDAY, "B6"),
            Pair(DayOfWeek.SATURDAY, "B7")
        )
    )

    describe("execute test") {
        context("sunday") {
            beforeEachTest {
                every { systemRepository.getTodaysDayOfWeek() } returns DayOfWeek.SUNDAY
            }
            context("lang type A") {
                it("word is A1") {
                    val getDayOfWeek = spyk(GetDayOfWeek(dayOfWeekRepository, systemRepository, executionThreads))
                    getDayOfWeek.execute(GetDayOfWeek.Request(langTypeMockA)).test()
                        .assertValue(GetDayOfWeek.Response(langTypeMockA, DayOfWeek.SUNDAY, "A1"))
                }
            }

            context("lang type B") {
                it("word is B1") {
                    val getDayOfWeek = spyk(GetDayOfWeek(dayOfWeekRepository, systemRepository, executionThreads))
                    getDayOfWeek.execute(GetDayOfWeek.Request(langTypeMockB)).test()
                        .assertValue(GetDayOfWeek.Response(langTypeMockB, DayOfWeek.SUNDAY, "B1"))

                }
            }
        }

        context("mock day of week type") {
            beforeEachTest {
                every { systemRepository.getTodaysDayOfWeek() } returns dayOfWeekMock
            }
            context("lang type B") {
                it("illegalArgumentException occur") {
                    val getDayOfWeek = spyk(GetDayOfWeek(dayOfWeekRepository, systemRepository, executionThreads))
                    getDayOfWeek.execute(GetDayOfWeek.Request(langTypeMockB)).test()
                        .assertError(IllegalArgumentException::class.java)
                }
            }
        }

        /* omit other tests*/
    }
})