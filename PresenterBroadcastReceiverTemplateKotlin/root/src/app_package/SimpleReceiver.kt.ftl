package ${packageName}

import dagger.android.DaggerBroadcastReceiver
import android.content.Context
import android.content.Intent

import javax.inject.Inject

class ${receiverName} : DaggerBroadcastReceiver(), ${contractName}.View {
    @Inject
    lateinit var presenter: ${contractName}.Presenter

    override fun onDestroy() {
        super.onDestroy()
        presenter.dispose()
    }
}
