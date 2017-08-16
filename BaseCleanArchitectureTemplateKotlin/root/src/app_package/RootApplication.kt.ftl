package ${packageName}

import dagger.android.AndroidInjector
import dagger.android.support.DaggerApplication
import com.jakewharton.threetenabp.AndroidThreeTen

class ${appClassName} : DaggerApplication() {
    override fun applicationInjector(): AndroidInjector<out DaggerApplication> {
        return DaggerRootComponent.builder().create(this)
    }

    override fun onCreate() {
        super.onCreate()
        AndroidThreeTen.init(this);
    }
}
