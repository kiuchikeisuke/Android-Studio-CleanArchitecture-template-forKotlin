package com.example.example.presenter.some

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.example.example.MainApplication
import com.example.example.R

class SomeActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.base_activity)

        var fragment = supportFragmentManager.findFragmentById(R.id.base_fragment) as SomeFragment?
        if (fragment == null) {
            fragment = SomeFragment.newInstance()
            supportFragmentManager.beginTransaction().add(R.id.base_fragment, fragment).commit()
        }
        /* FIXME 1st:MUST add below method to RootComponent */
        // fun newSomeComponent(module: SomeModule): SomeComponent

        /* FIXME 2nd:initialize SomeComponent like this */
        (application as MainApplication).rootComponent
                .newSomeComponent(SomeModule(fragment as SomeContract.View))
                .inject(fragment)
    }
}
