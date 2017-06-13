package ${packageName}

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import javax.inject.Inject
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${fragmentName} : Fragment(), ${contractName}.View {

    @Inject lateinit var presenter:${presenterName}

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater!!.inflate(R.layout.${fragmentLayoutName}, container, false)
        return view
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
