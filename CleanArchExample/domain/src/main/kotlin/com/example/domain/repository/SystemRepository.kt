package com.example.domain.repository

import com.example.domain.dayofweek.entity.DayOfWeek

interface SystemRepository {
    fun getTodaysDayOfWeek(): DayOfWeek
}
