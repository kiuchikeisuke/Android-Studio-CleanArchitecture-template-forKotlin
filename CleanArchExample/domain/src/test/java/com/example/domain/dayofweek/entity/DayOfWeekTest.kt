package com.example.domain.dayofweek.entity

import org.spekframework.spek2.Spek
import org.spekframework.spek2.style.specification.describe
import kotlin.test.assertEquals
import kotlin.test.assertTrue

internal object DayOfWeekTest : Spek({
    describe("DayOfWeek enum test") {
        context("support size") {
            it("7") {
                assertEquals(7, DayOfWeek.values().size)
            }
        }
        context("has enum type") {
            it("sunday") {
                assertTrue { DayOfWeek.values().contains(DayOfWeek.SUNDAY) }
            }
            it("monday") {
                assertTrue { DayOfWeek.values().contains(DayOfWeek.MONDAY) }
            }
            it("tuesday") {
                assertTrue { DayOfWeek.values().contains(DayOfWeek.TUESDAY) }
            }
            it("wednesday") {
                assertTrue { DayOfWeek.values().contains(DayOfWeek.WEDNESDAY) }
            }
            it("thursday") {
                assertTrue { DayOfWeek.values().contains(DayOfWeek.THURSDAY) }
            }
            it("friday") {
                assertTrue { DayOfWeek.values().contains(DayOfWeek.FRIDAY) }
            }
            it("saturday") {
                assertTrue { DayOfWeek.values().contains(DayOfWeek.SATURDAY) }
            }

        }
    }
})