package com.example.example.presenter.some

import android.content.Context
import android.content.Intent
import android.os.Bundle
import com.example.example.R
import com.example.example.presenter.some2.SomeFragment2
import dagger.android.support.DaggerAppCompatActivity

class SomeActivity : DaggerAppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.base_activity)

        var fragment = supportFragmentManager.findFragmentById(R.id.base_fragment) as SomeFragment?
        var fragment2 = supportFragmentManager.findFragmentById(R.id.base_fragment2) as SomeFragment2?
        if (fragment == null && fragment2 == null) {
            fragment = SomeFragment.newInstance()
            fragment2 = SomeFragment2.newInstance()

            supportFragmentManager.beginTransaction()
                    .add(R.id.base_fragment, fragment)
                    .add(R.id.base_fragment2, fragment2) //added for someFragment2
                    .commit()
        }
    }

    companion object {
        fun launch(context: Context, flags: Int = Intent.FLAG_ACTIVITY_NEW_TASK) {
            val intent = Intent(context, SomeActivity::class.java)
            intent.flags = flags
            context.startActivity(intent)
        }
    }
}
