package com.example.domain.repository

import com.example.domain.dayofweek.entity.DayOfWeekMapper
import com.example.domain.dayofweek.entity.Language

interface DayOfWeekRepository {
    fun getDayOfWeekMap(language: Language): DayOfWeekMapper
}
