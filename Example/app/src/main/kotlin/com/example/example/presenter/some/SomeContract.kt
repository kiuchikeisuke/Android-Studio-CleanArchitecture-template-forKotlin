package com.example.example.presenter.some

import com.example.example.data.entity.SomeDataEntity
import com.example.example.utils.commons.BaseView
import com.example.example.utils.commons.BasePresenter

interface SomeContract {

    interface View : BaseView {
        fun loaded(someDataEntity: SomeDataEntity)
    }

    interface Presenter : BasePresenter {
        fun load(inputParam:Int)
    }
}
