package com.example.data.datasource.dayofweek

import com.example.domain.dayofweek.entity.DayOfWeek
import com.example.domain.dayofweek.entity.DayOfWeekMapper
import com.example.domain.dayofweek.entity.Language
import io.mockk.spyk
import org.spekframework.spek2.Spek
import org.spekframework.spek2.style.specification.describe
import kotlin.test.assertEquals

internal object DayOfWeekDataStoreTest : Spek({
    val englishMapper = DayOfWeekMapper(
        mapOf(
            Pair(DayOfWeek.SUNDAY, "sunday"),
            Pair(DayOfWeek.MONDAY, "monday"),
            Pair(DayOfWeek.TUESDAY, "tuesday"),
            Pair(DayOfWeek.WEDNESDAY, "wednesday"),
            Pair(DayOfWeek.THURSDAY, "thursday"),
            Pair(DayOfWeek.FRIDAY, "friday"),
            Pair(DayOfWeek.SATURDAY, "saturday")
        )
    )
    val japaneseMapper = DayOfWeekMapper(
        mapOf(
            Pair(DayOfWeek.SUNDAY, "日曜"),
            Pair(DayOfWeek.MONDAY, "月曜"),
            Pair(DayOfWeek.TUESDAY, "火曜"),
            Pair(DayOfWeek.WEDNESDAY, "水曜"),
            Pair(DayOfWeek.THURSDAY, "木曜"),
            Pair(DayOfWeek.FRIDAY, "金曜"),
            Pair(DayOfWeek.SATURDAY, "土曜")
        )
    )
//    val germanyMapper = DayOfWeekMapper(
//        mapOf(
//            Pair(DayOfWeek.SUNDAY, "Sonntag"),
//            Pair(DayOfWeek.MONDAY, "Montag"),
//            Pair(DayOfWeek.TUESDAY, "Dienstag"),
//            Pair(DayOfWeek.WEDNESDAY, "Mittwoch"),
//            Pair(DayOfWeek.THURSDAY, "Donnerstag"),
//            Pair(DayOfWeek.FRIDAY, "Freitag"),
//            Pair(DayOfWeek.SATURDAY, "Samstag")
//        )
//    )
    val dayOfWeekDataStore = spyk<DayOfWeekDataStore>()
    describe("getDayOfWeek´Map test") {

        context("english type") {
            it("get englishMapper") {
                val act = dayOfWeekDataStore.getDayOfWeekMap(Language.English)
                assertEquals(englishMapper, act)
            }
        }

        context("japanese") {
            it("get japanese") {
                val act = dayOfWeekDataStore.getDayOfWeekMap(Language.Japanese)
                assertEquals(japaneseMapper, act)
            }
        }

//        context("germany") {
//            it("get germany") {
//                val act = dayOfWeekDataStore.getDayOfWeekMap(Language.Germany)
//                assertEquals(germanyMapper, act)
//            }
//        }
    }
})