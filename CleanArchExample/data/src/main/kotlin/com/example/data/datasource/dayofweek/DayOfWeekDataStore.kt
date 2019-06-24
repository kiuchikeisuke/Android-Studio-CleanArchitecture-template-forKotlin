package com.example.data.datasource.dayofweek

import com.example.domain.dayofweek.entity.DayOfWeek
import com.example.domain.dayofweek.entity.Language
import com.example.domain.repository.DayOfWeekRepository
import javax.inject.Inject

class DayOfWeekDataStore @Inject constructor() : DayOfWeekRepository {
    override fun getDayOfWeekMap(language: Language): Map<DayOfWeek, String> {
        return when (language) {
            Language.English ->
                mapOf(
                    Pair(DayOfWeek.SUNDAY, "sunday"),
                    Pair(DayOfWeek.MONDAY, "monday"),
                    Pair(DayOfWeek.TUESDAY, "tuesday"),
                    Pair(DayOfWeek.WEDNESDAY, "wednesday"),
                    Pair(DayOfWeek.THURSDAY, "thursday"),
                    Pair(DayOfWeek.FRIDAY, "friday"),
                    Pair(DayOfWeek.SATURDAY, "saturday")
                )
            Language.Japanese
            -> mapOf(
                Pair(DayOfWeek.SUNDAY, "日曜"),
                Pair(DayOfWeek.MONDAY, "月曜"),
                Pair(DayOfWeek.TUESDAY, "火曜"),
                Pair(DayOfWeek.WEDNESDAY, "水曜"),
                Pair(DayOfWeek.THURSDAY, "木曜"),
                Pair(DayOfWeek.FRIDAY, "金曜"),
                Pair(DayOfWeek.SATURDAY, "土曜")
            )
            // DEMO
//            Language.Germany
//            -> mapOf(
//                Pair(DayOfWeek.SUNDAY, "Sonntag"),
//                Pair(DayOfWeek.MONDAY, "Montag"),
//                Pair(DayOfWeek.TUESDAY, "Dienstag"),
//                Pair(DayOfWeek.WEDNESDAY, "Mittwoch"),
//                Pair(DayOfWeek.THURSDAY, "Donnerstag"),
//                Pair(DayOfWeek.FRIDAY, "Freitag"),
//                Pair(DayOfWeek.SATURDAY, "Samstag")
//            )
        }
    }

}
