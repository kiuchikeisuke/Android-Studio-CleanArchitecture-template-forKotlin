package com.example.presentation.presenter.main

import androidx.lifecycle.ViewModel
import com.example.domain.dayofweek.usecase.GetDayOfWeek
import javax.inject.Inject

class CleanArchMainPresenterViewModel @Inject constructor(private val getDayOfWeek: GetDayOfWeek) : ViewModel(),
    CleanArchMainContract.Presenter {


    override fun onCleared() {
        super.onCleared()
        /* TODO dispose UseCase here */
        getDayOfWeek.dispose()
    }
}
