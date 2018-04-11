package com.example.example.presenter.some

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.example.data.entity.SomeDataEntity
import com.example.example.databinding.FragmentSomeBinding
import dagger.android.support.DaggerFragment
import kotlinx.android.synthetic.main.fragment_some.*
import javax.inject.Inject

class SomeFragment : DaggerFragment(), SomeContract.View {

    @Inject lateinit var presenter: SomePresenter
    private lateinit var binding: FragmentSomeBinding

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = FragmentSomeBinding.inflate(inflater, container!!, false)
        return binding.root
    }

    override fun loaded(someDataEntity: SomeDataEntity) {
        binding.data = someDataEntity //dataBinding
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.input0Button.setOnClickListener { presenter.load(0)} //DataBinding
        input_1_button.setOnClickListener { presenter.load(1) } //Kotlin Android Extensions
    }


    override fun onDestroy() {
        super.onDestroy()
        presenter.dispose()
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
