package ${packageName}

import dagger.android.DaggerBroadcastReceiver
import android.content.Context
import android.content.Intent

import javax.inject.Inject

class ${receiverName} : DaggerBroadcastReceiver(), ${contractName}.View {
    @Inject lateinit var presenter:${presenterName}

    //FIXME Don't forget call this method on exit
    //presenter.dispose()
}
