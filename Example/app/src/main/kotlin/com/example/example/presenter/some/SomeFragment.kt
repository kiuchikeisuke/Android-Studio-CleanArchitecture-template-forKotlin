package com.example.example.presenter.some

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import butterknife.bindView
import com.example.example.R
import com.example.example.data.entity.SomeDataEntity
import kotlinx.android.synthetic.main.some_fragment.*
import javax.inject.Inject

class SomeFragment : Fragment(), SomeContract.View {
    @Inject lateinit var presenter: SomePresenter

    val inputText: TextView by bindView<TextView>(R.id.inputText) //KotterKnife

    override fun show(someDataEntity: SomeDataEntity) {
        inputText.text = someDataEntity.resParam1
    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater!!.inflate(R.layout.some_fragment, container, false)
        return view
    }

    override fun onViewCreated(view: View?, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        input_0_button.setOnClickListener { presenter.loadData(0) } //Kotlin Android Extensions
        input_1_button.setOnClickListener { presenter.loadData(1) } //Kotlin Android Extensions
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
