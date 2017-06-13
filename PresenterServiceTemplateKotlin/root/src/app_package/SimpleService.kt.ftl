package ${packageName}

import android.app.Service

import javax.inject.Inject

class ${serviceName} : Service(), ${contractName}.View {

override fun onCreate() {
    super.onCreate()

    /* FIXME 1st:MUST add below method to RootComponent */
    // fun new${componentName}(module: ${moduleName}): ${componentName}

    /* FIXME 2nd:initialize ${componentName} like this */
    (application as MainApplication).rootComponent
    .new${componentName}(${moduleName}(this)).inject(this)

}

    @Inject lateinit var presenter:${presenterName}

}
