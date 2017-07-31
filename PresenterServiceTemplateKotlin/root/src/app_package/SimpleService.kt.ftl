package ${packageName}

import dagger.android.DaggerService
import javax.inject.Inject

class ${serviceName} : DaggerService(), ${contractName}.View {
    @Inject lateinit var presenter:${presenterName}

    override fun onDestroy() {
        super.onDestroy()
        presenter.dispose()
    }
}
