package ${packageName}

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import dagger.android.support.DaggerFragment
import kotlinx.android.synthetic.main.${fragmentLayoutName}.*
import javax.inject.Inject
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${fragmentName} : DaggerFragment(), ${contractName}.View {

    @Inject lateinit var presenter:${presenterName}

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater!!.inflate(R.layout.${fragmentLayoutName}, container, false)
        return view
    }

    override fun onDestroy() {
        super.onDestroy()
        presenter.dispose()
    }

    companion object {
        fun newInstance(): ${fragmentName} {
            val args = Bundle()
            val fragment = ${fragmentName}()
            fragment.arguments = args
            return fragment
        }
    }
}
