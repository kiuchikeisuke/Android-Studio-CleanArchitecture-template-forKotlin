package com.example.domain.repository

import com.example.domain.dayofweek.entity.DayOfWeek
import com.example.domain.dayofweek.entity.Language

interface DayOfWeekRepository {
    fun getTodaysDayOfWeek(): DayOfWeek
    fun getDayOfWeekWords(language: Language): Map<DayOfWeek, String>
}
