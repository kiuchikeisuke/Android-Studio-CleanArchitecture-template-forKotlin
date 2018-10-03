package com.example.example.presenter.some2

import android.arch.lifecycle.ViewModelProvider
import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.example.databinding.FragmentSome2Binding
import com.example.example.utils.di.Injectable
import kotlinx.android.synthetic.main.fragment_some.*
import javax.inject.Inject

class SomeFragment2: Fragment(), SomeFragment2Contract.View, Injectable {
    /* FIXME MUST add below method to Parent Activity's Module */
//    @Binds @IntoMap @ViewModelKey(SomePresenter2ViewModel::class) abstract fun bindSomePresenter2ViewModel(viewModel: SomePresenter2ViewModel): ViewModel
//    @ContributesAndroidInjector abstract fun contributeSomeFragment2():SomeFragment2
    @Inject
    lateinit var viewModelFactory: ViewModelProvider.Factory
    private val presenter: SomeFragment2PresenterViewModel by lazy {
        // If share ViewModel with other fragments on same Activity, fix 'this' -> 'activity!!'
        ViewModelProviders.of(this, viewModelFactory).get(SomeFragment2PresenterViewModel::class.java)
    }
    private lateinit var binding: FragmentSome2Binding

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = FragmentSome2Binding.inflate(inflater, container!!, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.input0Button.setOnClickListener { presenter.load(0, {binding.data = it.someDataEntity})} //DataBinding
        input_1_button.setOnClickListener { presenter.load(1, {binding.data = it.someDataEntity}) } //Kotlin Android Extensions
    }

    companion object {
        fun newInstance(): SomeFragment2 {
            val args = Bundle()
            val fragment = SomeFragment2()
            fragment.arguments = args
            return fragment
        }
    }
}