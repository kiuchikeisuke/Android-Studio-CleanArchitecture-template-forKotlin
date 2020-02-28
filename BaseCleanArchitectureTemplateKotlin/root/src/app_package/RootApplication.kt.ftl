package ${packageName}

<#if applicationPackage??>
import ${applicationPackage}.DaggerRootComponent
import ${applicationPackage}.presenter.utils.di.applyAutoInjector
</#if>
import com.jakewharton.threetenabp.AndroidThreeTen
import dagger.android.AndroidInjector
import dagger.android.support.DaggerApplication
import timber.log.Timber

class ${appClassName} : DaggerApplication() {
    override fun applicationInjector(): AndroidInjector<out DaggerApplication> {
        return DaggerRootComponent.builder().create(this)
    }

    override fun onCreate() {
        super.onCreate()
        if (BuildConfig.DEBUG) {
            Timber.plant(Timber.DebugTree())
        }
        AndroidThreeTen.init(this);
        applyAutoInjector()
    }
}
