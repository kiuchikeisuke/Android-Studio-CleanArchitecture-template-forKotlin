package ${packageName}

import android.app.Application

class ${appClassName} : Application() {

    lateinit var rootComponent: RootComponent

    override fun onCreate() {
        super.onCreate()
        init()
    }

    private fun init() {
        rootComponent = DaggerRootComponent.builder()
                .applicationModule(ApplicationModule(this))
                .build()
    }
}
