package com.example.data.datasource.system

import com.example.domain.dayofweek.entity.DayOfWeek
import com.example.domain.repository.SystemRepository
import java.util.*
import javax.inject.Inject

class SystemDataStore @Inject constructor() : SystemRepository {
    override fun getTodaysDayOfWeek(): DayOfWeek {
        val calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Tokyo"), Locale.JAPAN)
//        val calendar = Calendar.getInstance(TimeZone.getTimeZone("Europe/Berlin"), Locale.GERMANY)

        calendar.time = Date()
        return when (calendar.get(Calendar.DAY_OF_WEEK)) {
            Calendar.SUNDAY -> DayOfWeek.SUNDAY
            Calendar.MONDAY -> DayOfWeek.MONDAY
            Calendar.TUESDAY -> DayOfWeek.TUESDAY
            Calendar.WEDNESDAY -> DayOfWeek.WEDNESDAY
            Calendar.THURSDAY -> DayOfWeek.THURSDAY
            Calendar.FRIDAY -> DayOfWeek.FRIDAY
            Calendar.SATURDAY -> DayOfWeek.SATURDAY
            else -> throw IllegalArgumentException()
        }
    }
}
