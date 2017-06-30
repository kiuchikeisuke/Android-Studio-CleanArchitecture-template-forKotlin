package ${packageName}

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
        /* FIXME 1st:MUST add below method to RootComponent */
        // fun new${componentName}(module: ${moduleName}): ${componentName}

        /* FIXME 2nd:initialize ${componentName} like this */
        (application as MainApplication).rootComponent
        .new${componentName}(${moduleName}(fragment as ${contractName}.View)).inject(fragment)
    }

    companion object {
        fun launch(context: Context) {
            val intent = Intent(context, ${activityName}::class.java)
            context.startActivity(intent)
        }
    }
}
