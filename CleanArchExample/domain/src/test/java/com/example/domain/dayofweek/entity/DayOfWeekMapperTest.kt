package com.example.domain.dayofweek.entity

import org.junit.jupiter.api.Assertions.assertDoesNotThrow
import org.junit.jupiter.api.Assertions.assertThrows
import org.spekframework.spek2.Spek
import org.spekframework.spek2.style.specification.describe

internal object DayOfWeekMapperTest : Spek({
    val enoughMap = mapOf(
        Pair(DayOfWeek.SUNDAY, "A1"),
        Pair(DayOfWeek.MONDAY, "A2"),
        Pair(DayOfWeek.TUESDAY, "A3"),
        Pair(DayOfWeek.WEDNESDAY, "A4"),
        Pair(DayOfWeek.THURSDAY, "A5"),
        Pair(DayOfWeek.FRIDAY, "A6"),
        Pair(DayOfWeek.SATURDAY, "A7")
    )
    val emptyMap = mapOf<DayOfWeek, String>()
    val notEnoughMap = mapOf(
        Pair(DayOfWeek.SUNDAY, "A1"),
        Pair(DayOfWeek.MONDAY, "A2"),
        Pair(DayOfWeek.TUESDAY, "A3"),
        Pair(DayOfWeek.WEDNESDAY, "A4"),
        Pair(DayOfWeek.THURSDAY, "A5"),
        Pair(DayOfWeek.FRIDAY, "A6")
    )

    describe("dayOfWeekMapper init test") {
        context("map size is 7") {
            it("no error") {
                assertDoesNotThrow { DayOfWeekMapper(enoughMap) }
            }
        }

        context("empty map") {
            it("IllegalArgumentException occur") {
                assertThrows(IllegalArgumentException::class.java) { DayOfWeekMapper(emptyMap) }
            }
        }

        context("not enough map") {
            it("IllegalArgumentException occur") {
                assertThrows(IllegalArgumentException::class.java) { DayOfWeekMapper(notEnoughMap) }
            }
        }
    }
})