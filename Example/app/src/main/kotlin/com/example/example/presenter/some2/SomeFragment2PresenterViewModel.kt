package com.example.example.presenter.some2

import android.arch.lifecycle.ViewModel
import com.example.example.domain.some.GetSomeData
import javax.inject.Inject

class SomeFragment2PresenterViewModel @Inject constructor(private val getSomeData: GetSomeData) : ViewModel(), SomeFragment2Contract.Presenter {

    override fun load(inputParam: Int, next:(GetSomeData.Response) -> Unit) {
        getSomeData.execute(GetSomeData.Request(inputParam), next)
    }

    override fun onCleared() {
        super.onCleared()
        getSomeData.dispose()
    }
}