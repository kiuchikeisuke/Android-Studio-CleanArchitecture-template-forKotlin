package com.example.presentation.presenter.main

import androidx.lifecycle.ViewModel
import com.example.domain.dayofweek.entity.Language
import com.example.domain.dayofweek.usecase.GetDayOfWeek
import javax.inject.Inject

class CleanArchMainPresenterViewModel @Inject constructor(private val getDayOfWeek: GetDayOfWeek) : ViewModel(),
    CleanArchMainContract.Presenter {
    override fun loadDayOfWeek(language: Language, next: (String) -> Unit) {
        when (language) {
            Language.English -> getDayOfWeek.execute(
                GetDayOfWeek.Request(language),
                next = { next("Today is " + it.word) })
            Language.Japanese -> getDayOfWeek.execute(
                GetDayOfWeek.Request(language),
                next = { next("今日は " + it.word) })
            // DEMO
//            Language.Germany -> getDayOfWeek.execute(
//                GetDayOfWeek.Request(language),
//                next = { next("Heute ist " + it.word) })
        }
    }


    override fun onCleared() {
        super.onCleared()
        /* TODO dispose UseCase here */
        getDayOfWeek.dispose()
    }
}
