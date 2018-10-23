package ${packageName}

import androidx.lifecycle.ViewModel
import javax.inject.Inject

class ${presenterViewModelName} @Inject constructor(/* add private val UseCase here */):ViewModel(), ${contractName}.Presenter {
    override fun onCleared() {
        super.onCleared()
        /* TODO dispose UseCase here */
    }
}
