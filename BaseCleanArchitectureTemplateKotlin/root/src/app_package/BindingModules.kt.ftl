package ${packageName}.utils.di

import android.arch.lifecycle.ViewModelProvider
import dagger.Binds
import dagger.Module

/* bind modules for Presenter's modules */
@Module
internal abstract class BindingModules {
    @Binds abstract fun bindViewModelFactory(factory: ViewModelFactory): ViewModelProvider.Factory

    /*If you add a new presenter(activity, broadcast, service), add a new contributeMethod. For detail, refer to FIXME of each presenter's module */

}
