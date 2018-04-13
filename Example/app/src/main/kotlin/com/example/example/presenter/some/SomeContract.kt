package com.example.example.presenter.some

import com.example.example.domain.some.GetSomeData
import com.example.example.utils.commons.BasePresenter
import com.example.example.utils.commons.BaseView

interface SomeContract {

    interface View : BaseView

    interface Presenter : BasePresenter {
        fun load(inputParam:Int, next: (GetSomeData.GetSomeDataResponse) -> Unit)
    }
}
