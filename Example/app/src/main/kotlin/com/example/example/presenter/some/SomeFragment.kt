package com.example.example.presenter.some

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import dagger.android.support.DaggerFragment
import kotlinx.android.synthetic.main.fragment_some.*
import javax.inject.Inject
import com.example.example.R
import com.example.example.data.entity.SomeDataEntity
import kotterknife.bindView

class SomeFragment : DaggerFragment(), SomeContract.View {

    @Inject lateinit var presenter: SomePresenter

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater!!.inflate(R.layout.fragment_some, container, false)
        return view
    }

    val inputText: TextView by bindView<TextView>(R.id.inputText) //KotterKnife

    override fun loaded(someDataEntity: SomeDataEntity) {
        inputText.text = someDataEntity.resParam1
    }

    override fun onViewCreated(view: View?, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        input_0_button.setOnClickListener { presenter.load(0) } //Kotlin Android Extensions
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
