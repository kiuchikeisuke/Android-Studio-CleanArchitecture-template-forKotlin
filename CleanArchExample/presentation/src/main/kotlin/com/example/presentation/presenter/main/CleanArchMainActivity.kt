package com.example.presentation.presenter.main

import android.content.Context
import android.content.Intent
import android.os.Bundle
import com.example.presentation.R
import dagger.android.support.DaggerAppCompatActivity

class CleanArchMainActivity : DaggerAppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.base_activity)

        var fragment = supportFragmentManager.findFragmentById(R.id.base_fragment) as CleanArchMainFragment?
        if (fragment == null) {
            fragment = CleanArchMainFragment.newInstance()
            supportFragmentManager.beginTransaction().add(R.id.base_fragment, fragment).commit()
        }
    }

    companion object {
        fun launch(context: Context, flags: Int = Intent.FLAG_ACTIVITY_NEW_TASK) {
            val intent = Intent(context, CleanArchMainActivity::class.java)
            intent.flags = flags
            context.startActivity(intent)
        }
    }
}
