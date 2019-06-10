package com.example.presentation.presenter.main

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import kotlinx.android.synthetic.main.fragment_clean_arch_main.*
import javax.inject.Inject
import com.example.presentation.R
import com.example.presentation.databinding.FragmentCleanArchMainBinding
import com.example.presentation.utils.di.Injectable

class CleanArchMainFragment : Fragment(), Injectable, CleanArchMainContract.View {

    @Inject
    lateinit var viewModelFactory: ViewModelProvider.Factory
    private val presenterVM: CleanArchMainPresenterViewModel  by lazy {
        // If share ViewModel with other fragments on same Activity, fix 'this' -> 'activity!!'
        ViewModelProviders.of(this, viewModelFactory).get(CleanArchMainPresenterViewModel::class.java)
    }

    private lateinit var binding: FragmentCleanArchMainBinding

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = FragmentCleanArchMainBinding.inflate(inflater, container!!, false)
        return binding.root
    }

    companion object {
        fun newInstance(): CleanArchMainFragment {
            val args = Bundle()
            val fragment = CleanArchMainFragment()
            fragment.arguments = args
            return fragment
        }
    }
}
