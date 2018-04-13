package com.example.example.presenter.some

import android.arch.lifecycle.ViewModel
import com.example.example.domain.some.GetSomeData
import javax.inject.Inject

class SomePresenterViewModel @Inject constructor(private val getSomeData: GetSomeData) :ViewModel(), SomeContract.Presenter {

    override fun load(inputParam: Int, next:(GetSomeData.GetSomeDataResponse) -> Unit) {
        getSomeData.execute(GetSomeData.GetSomeDataRequest(inputParam), next)
    }

    override fun onCleared() {
        super.onCleared()
        getSomeData.dispose()
    }
}
