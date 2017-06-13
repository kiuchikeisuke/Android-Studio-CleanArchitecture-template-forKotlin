package com.example.example.presenter.some

import com.example.example.domain.some.GetSomeData
import com.example.example.utils.commons.DefaultDisposableObserver
import javax.inject.Inject

class SomePresenter @Inject constructor(private val view:SomeContract.View, private val getSomeData: GetSomeData): SomeContract.Presenter {

    override fun dispose() {
        getSomeData.dispose()
    }

    override fun loadData(inputParam: Int) {
        getSomeData.execute(GetSomeData.GetSomeDataRequest(inputParam),object: DefaultDisposableObserver<GetSomeData.GetSomeDataResponse>(){
            override fun onNext(t: GetSomeData.GetSomeDataResponse) {
                super.onNext(t)
                view.show(t.someDataEntity)
            }
        })

    }

}
