package ${packageName}

import android.content.Context
import ${packageName}.data.RepositoryModules
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = arrayOf(ApplicationModule::class, RepositoryModules::class, ApiModules::class))
interface RootComponent {
    val context: Context

    /*TODO if you add a new presenter's component, add a new NewComponentMethod like this!! */
    //fun newSomeComponent(someModule: SomeModule): SomeComponent
}
