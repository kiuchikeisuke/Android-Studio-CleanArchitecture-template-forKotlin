package com.example.example

import dagger.Module
import dagger.Provides
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory

/* module for API connection(e.g retrofit2, http3, etc..) */
@Module
class ApiModules {
    @Provides fun provideOkHttpClientBuilder(): OkHttpClient.Builder {
        val interceptor = HttpLoggingInterceptor()
        interceptor.level = HttpLoggingInterceptor.Level.BODY
        return OkHttpClient.Builder().addInterceptor(interceptor)
    }

    private fun createRetrofitBuilder(endPoint: String): Retrofit.Builder =
            Retrofit.Builder()
                    .baseUrl(endPoint)
                    .addConverterFactory(GsonConverterFactory.create())
                    .addCallAdapterFactory(RxJava2CallAdapterFactory.create())

    @Provides fun provideRetrofitBuilder(): Retrofit.Builder {
        return createRetrofitBuilder("http://localhost/some/api")
    }

    private fun <S> createService(serviceClass: Class<S>, retrofitBuilder:Retrofit.Builder, okHttpClientBuilder:OkHttpClient.Builder ): S {
        return retrofitBuilder.client(okHttpClientBuilder.build()).build().create(serviceClass)
    }

    /*FIXME if you add some RetrofitService, add provide method. Like this */
    //  @Provides fun provideSomeApiService(retrofitBuilder:Retrofit.Builder, builder: OkHttpClient.Builder):SomeApiService {
    //      createService(SomeApiService::class.java,retrofitBuilder, builder)
    //  }

}
