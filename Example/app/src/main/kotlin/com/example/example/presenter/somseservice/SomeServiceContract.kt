package com.example.example.presenter.somseservice

import com.example.example.utils.commons.BaseView
import com.example.example.utils.commons.BasePresenter

interface SomeServiceContract {
    interface View : BaseView {

    }

    interface Presenter : BasePresenter {
        fun dispose()
    }
}
