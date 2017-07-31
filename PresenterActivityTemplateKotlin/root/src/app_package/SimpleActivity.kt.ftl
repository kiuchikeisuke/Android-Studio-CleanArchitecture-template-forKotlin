package ${packageName}

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${activityName} : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.base_activity)

        var fragment = supportFragmentManager.findFragmentById(R.id.base_fragment) as ${fragmentName}?
        if (fragment == null) {
            fragment = ${fragmentName}.newInstance()
            supportFragmentManager.beginTransaction().add(R.id.base_fragment, fragment).commit()
        }
    }

    companion object {
        fun launch(context: Context, flags:Int = Intent.FLAG_ACTIVITY_NEW_TASK) {
            val intent = Intent(context, ${activityName}::class.java)
            intent.flags = flags
            context.startActivity(intent)
        }
    }
}
