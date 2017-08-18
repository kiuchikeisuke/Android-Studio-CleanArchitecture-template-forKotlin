package ${packageName}.utils.commons

import io.reactivex.observers.DisposableObserver

class DefaultDisposableObserver<T>(val next:(T)->Unit = {},
                                        val error:(Throwable)->Unit = {},
                                        val complete:()->Unit = {}) : DisposableObserver<T>() {
    override fun onNext(t: T) = next(t)

    override fun onError(e: Throwable) = error(e)

    override fun onComplete() = complete()
}
