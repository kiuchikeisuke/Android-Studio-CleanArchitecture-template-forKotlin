package com.example.example.presenter.somereceiver

import dagger.android.DaggerBroadcastReceiver
import android.content.Context
import android.content.Intent

import javax.inject.Inject

class SomeReceiverReceiver : DaggerBroadcastReceiver(), SomeReceiverContract.View {
    @Inject
    lateinit var presenter: SomeReceiverPresenter

    //FIXME Don't forget call this method on exit
    //presenter.dispose()
}
