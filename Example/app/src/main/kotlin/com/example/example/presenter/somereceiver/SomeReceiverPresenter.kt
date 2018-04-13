package com.example.example.presenter.somereceiver

import javax.inject.Inject

class SomeReceiverPresenter @Inject constructor(/* add private val UseCase here */) : SomeReceiverContract.Presenter {
    override fun dispose() {
        //TODO dispose Domain here!!
    }
}
