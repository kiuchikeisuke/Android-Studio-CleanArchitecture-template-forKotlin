package ${packageName}

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import kotlinx.android.synthetic.main.${fragmentLayoutName}.*
import javax.inject.Inject
<#if applicationPackage??>
import ${applicationPackage}.R
import ${applicationPackage}.databinding.${bindingName}
import ${applicationPackage}.presenter.utils.di.Injectable
</#if>

class ${fragmentName} : Fragment(), Injectable, ${contractName}.View {
    @Inject
    lateinit var presenter: ${contractName}.Presenter

    private lateinit var binding: ${bindingName}

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = ${bindingName}.inflate(inflater, container!!, false)
        return binding.root
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
