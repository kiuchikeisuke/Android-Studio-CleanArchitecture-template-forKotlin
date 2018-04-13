package com.example.example.presenter.some

import android.arch.lifecycle.ViewModelProvider
import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.example.databinding.FragmentSomeBinding
import com.example.example.utils.di.Injectable
import kotlinx.android.synthetic.main.fragment_some.*
import javax.inject.Inject

class SomeFragment : Fragment(), SomeContract.View, Injectable {

    @Inject lateinit var viewModelFactory: ViewModelProvider.Factory
    private val presenter: SomePresenterViewModel by lazy {
        // If share ViewModel with other fragments on same Activity, fix 'this' -> 'activity!!'
        ViewModelProviders.of(this, viewModelFactory).get(SomePresenterViewModel::class.java)
    }
    private lateinit var binding: FragmentSomeBinding

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = FragmentSomeBinding.inflate(inflater, container!!, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.input0Button.setOnClickListener { presenter.load(0, {binding.data = it.someDataEntity})} //DataBinding
        input_1_button.setOnClickListener { presenter.load(1, {binding.data = it.someDataEntity}) } //Kotlin Android Extensions
    }

    companion object {
        fun newInstance(): SomeFragment {
            val args = Bundle()
            val fragment = SomeFragment()
            fragment.arguments = args
            return fragment
        }
    }
}
