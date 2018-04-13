package com.example.example.presenter.somseservice

import javax.inject.Inject

class SomeServicePresenter @Inject constructor(/* add private val UseCase here */) : SomeServiceContract.Presenter {
    override fun dispose() {
        //TODO dispose Domain here!!
    }
}
