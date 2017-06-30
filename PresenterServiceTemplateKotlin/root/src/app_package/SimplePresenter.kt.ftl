package ${packageName}

import javax.inject.Inject

class ${presenterName} @Inject constructor(private val view:${contractName}.View): ${contractName}.Presenter {
    override fun dispose() {
        //TODO dispose Domain here!!
    }
}
