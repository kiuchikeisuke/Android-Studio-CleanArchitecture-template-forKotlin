package com.example.example.utils.extensions

import io.reactivex.Observable
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.internal.operators.observable.ObservableSubscribeOn
import io.reactivex.plugins.RxJavaPlugins

fun <T> Observable<T>.subscribeOnMainThread(): Observable<T> {
    return RxJavaPlugins.onAssembly<T>(ObservableSubscribeOn<T>(this, AndroidSchedulers.mainThread()))
}
