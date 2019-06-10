package com.example.presentation.presenter.main

import com.example.domain.dayofweek.entity.Language
import com.example.presentation.utils.commons.BasePresenter
import com.example.presentation.utils.commons.BaseView

interface CleanArchMainContract {

    interface View : BaseView {

    }

    interface Presenter : BasePresenter {
        fun loadDayOfWeek(language: Language, next: (String) -> Unit)
    }
}
