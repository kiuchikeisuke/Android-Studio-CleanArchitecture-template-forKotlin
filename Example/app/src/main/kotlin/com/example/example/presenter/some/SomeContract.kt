package com.example.example.presenter.some

import com.example.example.data.entity.SomeDataEntity
import com.example.example.utils.commons.BasePresenter
import com.example.example.utils.commons.BaseView

interface SomeContract {

    interface View : BaseView {
        fun show(someDataEntity: SomeDataEntity)
    }

    interface Presenter : BasePresenter {
        fun loadData(inputParam:Int)
    }
}
