package ${packageName}

import ${packageName}.utils.commons.ExecutionThreads

import android.content.Context
import android.content.SharedPreferences
import dagger.Module
import dagger.Provides
import io.reactivex.Scheduler
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
<#if includeRealm>
import io.realm.BuildConfig
import io.realm.Realm
import io.realm.RealmConfiguration
</#if>

/* Module for Application */
@Module
class ApplicationModule(val context: Context) {
    val sharedPreference : SharedPreferences
        get() = context.getSharedPreferences(context.getString(R.string.app_name), Context.MODE_PRIVATE)

    @Provides
    fun provideContext(): Context = context

<#if includeRealm>
    @Provides
    fun provideRealm(): Realm {
        val builder = RealmConfiguration.Builder().name(context.getString(R.string.app_name))
        if (BuildConfig.DEBUG) {
            return Realm.getInstance(builder.deleteRealmIfMigrationNeeded().build())
        } else {
            return Realm.getInstance(builder.build())
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

    @Provides
    fun provideSharedPreference(): SharedPreferences = sharedPreference

}
