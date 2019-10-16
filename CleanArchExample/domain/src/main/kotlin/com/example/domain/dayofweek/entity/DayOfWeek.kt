package com.example.domain.dayofweek.entity

enum class DayOfWeek {
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY;
}

data class DayOfWeekMapper(val mapper: Map<DayOfWeek, String>) {
    init {
        if (mapper.size != DayOfWeek.values().size) {
            throw IllegalArgumentException("mapper size isn't equal DayOfWeeks")
        }
    }
}