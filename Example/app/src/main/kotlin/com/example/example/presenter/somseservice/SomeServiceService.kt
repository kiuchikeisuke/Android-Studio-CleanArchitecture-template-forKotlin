package com.example.example.presenter.somseservice

import android.content.Intent
import android.os.Binder
import android.os.IBinder
import dagger.android.DaggerService
import javax.inject.Inject

class SomeServiceService : DaggerService(), SomeServiceContract.View {
    override fun onBind(p0: Intent?): IBinder {
        return SomeBinder()
    }

    @Inject
    lateinit var presenter: SomeServicePresenter

    override fun onDestroy() {
        super.onDestroy()
        presenter.dispose()
    }

    private class SomeBinder : Binder(){

    }
}
