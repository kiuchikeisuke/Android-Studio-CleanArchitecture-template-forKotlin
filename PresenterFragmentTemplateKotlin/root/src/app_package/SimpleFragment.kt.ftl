package ${packageName}

import android.arch.lifecycle.ViewModelProvider
import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.support.v4.app.Fragment
import kotlinx.android.synthetic.main.${fragmentLayoutName}.*
import javax.inject.Inject
<#if applicationPackage??>
import ${applicationPackage}.R
import ${applicationPackage}.databinding.${bindingName}
import ${applicationPackage}.utils.di.Injectable
</#if>

class ${fragmentName} : Fragment(), Injectable, ${contractName}.View {
      /* FIXME MUST add below method to Parent Activity's Module */
//    @Binds @IntoMap @ViewModelKey(${presenterViewModelName}::class) abstract fun bind${presenterViewModelName}(viewModel: ${presenterViewModelName}): ViewModel
//    @ContributesAndroidInjector abstract fun contribute${fragmentName}():${fragmentName}

    @Inject lateinit var viewModelFactory: ViewModelProvider.Factory
    private val presenterVM:${presenterViewModelName}  by lazy {
        // If share ViewModel with other fragments on same Activity, fix 'this' -> 'activity!!'
        ViewModelProviders.of(this, viewModelFactory).get(${presenterViewModelName}::class.java)
    }

    private lateinit var binding: ${bindingName}

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = ${bindingName}.inflate(inflater, container!!, false)
        return binding.root
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
