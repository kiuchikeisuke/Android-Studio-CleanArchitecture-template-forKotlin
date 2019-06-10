package com.example.presentation.presenter.main

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import com.example.domain.dayofweek.entity.Language
import com.example.presentation.databinding.FragmentCleanArchMainBinding
import com.example.presentation.utils.di.Injectable
import javax.inject.Inject

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
        binding.buttonEng.setOnClickListener {
            presenterVM.loadDayOfWeek(Language.English) { binding.textView.text = it }
        }
        binding.buttonJp.setOnClickListener {
            presenterVM.loadDayOfWeek(Language.Japanese) { binding.textView.text = it }
        }
        binding.buttonGar.setOnClickListener {
            presenterVM.loadDayOfWeek(Language.Germany) { binding.textView.text = it }
        }
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
