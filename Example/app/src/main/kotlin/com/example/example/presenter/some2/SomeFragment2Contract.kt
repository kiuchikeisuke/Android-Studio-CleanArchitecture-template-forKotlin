package com.example.example.presenter.some2

import com.example.example.domain.some.GetSomeData
import com.example.example.utils.commons.BasePresenter
import com.example.example.utils.commons.BaseView

interface SomeFragment2Contract {
    interface View : BaseView

    interface Presenter : BasePresenter {
        fun load(inputParam:Int, next: (GetSomeData.Response) -> Unit)
    }
}