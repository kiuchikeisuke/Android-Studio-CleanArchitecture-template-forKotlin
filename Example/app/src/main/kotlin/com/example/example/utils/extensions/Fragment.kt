package jp.ne.nissing.rakutencall.utils.extensions

import android.support.v4.app.Fragment

inline fun <reified T> Fragment.lazyWithArgs(key: String): Lazy<T> {
    return lazy { arguments!!.get(key) as T }
}