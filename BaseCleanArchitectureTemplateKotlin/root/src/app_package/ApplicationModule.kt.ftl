package ${packageName}

import ${packageName}.domain.utils.commons.ExecutionThreads

import android.content.Context
import android.content.SharedPreferences
import dagger.Module
import dagger.Provides
import io.reactivex.Scheduler
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
<#if includeRealm>
import io.realm.Realm
import io.realm.RealmConfiguration
</#if>
import ${packageName}.${appClassName}
import ${packageName}.R
import ${packageName}.BuildConfig

/* Module for Application */
@Module
class ApplicationModule {
    @Provides fun provideContext(application: ${appClassName}):Context = application
    @Provides fun provideSharedPreference(application: ${appClassName}): SharedPreferences = application.getSharedPreferences(application.getString(R.string.app_name), Context.MODE_PRIVATE)

<#if includeRealm>
    @Provides
    fun provideRealm(application: ${appClassName}): Realm {
        val builder = RealmConfiguration.Builder().name(application.getString(R.string.app_name))
        return if (BuildConfig.DEBUG) {
            Realm.getInstance(builder.deleteRealmIfMigrationNeeded().build())
        } else {
            Realm.getInstance(builder.build())
        }
    }

</#if>
    @Provides
    fun provideExecutionThreads(): ExecutionThreads {
        return object : ExecutionThreads {
            override fun ui(): Scheduler = AndroidSchedulers.mainThread()
            override fun io(): Scheduler = Schedulers.io()
        }
    }


}
