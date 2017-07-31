package com.example.example.presenter.some

import com.example.example.domain.some.GetSomeData
import com.example.example.utils.commons.DefaultDisposableObserver
import javax.inject.Inject

class SomePresenter @Inject constructor(private val view: SomeContract.View,private val getSomeData: GetSomeData) : SomeContract.Presenter {

    override fun load(inputParam: Int) {
        getSomeData.execute(GetSomeData.GetSomeDataRequest(inputParam), DefaultDisposableObserver<GetSomeData.GetSomeDataResponse>(next = {view.loaded(it.someDataEntity)}))
    }

    override fun dispose() {
        //TODO dispose Domain here!!
        getSomeData.dispose()
    }
}
