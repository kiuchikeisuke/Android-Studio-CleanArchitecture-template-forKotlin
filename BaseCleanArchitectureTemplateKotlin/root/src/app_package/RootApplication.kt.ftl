package ${packageName}

import dagger.android.AndroidInjector
import dagger.android.support.DaggerApplication

class ${appClassName} : DaggerApplication() {
    override fun applicationInjector(): AndroidInjector<out DaggerApplication> {
        return DaggerRootComponent.builder().create(this)
    }
}
