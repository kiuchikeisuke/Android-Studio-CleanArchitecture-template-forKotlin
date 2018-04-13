package com.example.example.presenter.somereceiver

import com.example.example.utils.commons.BaseView
import com.example.example.utils.commons.BasePresenter

interface SomeReceiverContract {
    interface View : BaseView {

    }

    interface Presenter : BasePresenter {
        fun dispose()
    }
}
