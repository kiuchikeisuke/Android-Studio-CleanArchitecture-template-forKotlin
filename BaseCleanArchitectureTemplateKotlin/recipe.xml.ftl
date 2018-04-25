<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <#-- init dirs -->
    <#if createKotlinDir>
      <mkdir at="${escapeXmlAttribute(projectOut)}/src/androidTest/kotlin"/>
      <mkdir at="${escapeXmlAttribute(projectOut)}/src/main/kotlin"/>
      <mkdir at="${escapeXmlAttribute(projectOut)}/src/test/kotlin"/>
    </#if>
    <mkdir at="${escapeXmlAttribute(projectOut)}/proguard" />
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/data"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/data/datasource"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/data/entity"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/domain"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/presenter"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/utils"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/utils/annotations"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/utils/commons"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/utils/exceptions"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/utils/extensions"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/utils/di"/>


    <#-- init build.gradle -->
    <@kt.addAllKotlinDependencies />
    <merge from="root/top_build.gradle.ftl"
             to="${escapeXmlAttribute(topOut)}/build.gradle" />
    <instantiate from="root/versions.gradle.ftl"
             to="${escapeXmlAttribute(topOut)}/versions.gradle" />
    <merge from="root/build.gradle.ftl"
             to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <dependency mavenUrl="com.google.dagger:dagger:2.+" />
    <dependency mavenUrl="com.google.dagger:dagger-android:2.+" />
    <dependency mavenUrl="com.google.dagger:dagger-android-support:2.+" />
    <dependency mavenUrl="io.reactivex.rxjava2:rxjava:+" />
    <dependency mavenUrl="io.reactivex.rxjava2:rxkotlin:+" />
    <dependency mavenUrl="io.reactivex.rxjava2:rxandroid:+" />
    <dependency mavenUrl="com.jakewharton.threetenabp:threetenabp:+" />
    <dependency mavenUrl="com.android.support.constraint:constraint-layout:+" />
    <dependency mavenUrl="androidx.core:core-ktx:+" />
    <dependency mavenUrl="com.jakewharton.timber:timber:+" />
    <dependency mavenUrl="com.squareup.leakcanary:leakcanary-android:+" />
    <dependency mavenUrl="android.arch.lifecycle:extensions:+" />
    <dependency mavenUrl="android.arch.lifecycle:reactivestreams:+" />
    <#if includeRetrofit>
      <dependency mavenUrl="com.squareup.retrofit2:retrofit:+" />
      <dependency mavenUrl="com.squareup.retrofit2:converter-scalars:+" />
      <dependency mavenUrl="com.squareup.retrofit2:adapter-rxjava2:+" />
      <dependency mavenUrl="com.squareup.okhttp3:logging-interceptor:+" />
      <dependency mavenUrl="com.squareup.retrofit:converter-moshi:+" />
      <dependency mavenUrl="com.squareup.moshi:moshi:+" />
      <dependency mavenUrl="com.squareup.moshi:moshi-kotlin:+" />
    </#if>
    <#-- init proguard -->
    <instantiate from="root/proguard/proguard-google-dagger2.pro.ftl"
                  to="${escapeXmlAttribute(projectOut)}/proguard/proguard-google-dagger2.pro" />
    <instantiate from="root/proguard/proguard-rx-java.pro.ftl"
                  to="${escapeXmlAttribute(projectOut)}/proguard/proguard-rx-java.pro" />
    <instantiate from="root/proguard/proguard-rx-java2.pro.ftl"
                  to="${escapeXmlAttribute(projectOut)}/proguard/proguard-rx-java2.pro" />
    <instantiate from="root/proguard/proguard-support-design.pro.ftl"
                  to="${escapeXmlAttribute(projectOut)}/proguard/proguard-support-design.pro" />
    <instantiate from="root/proguard/proguard-support-v7-appcompat.pro.ftl"
                  to="${escapeXmlAttribute(projectOut)}/proguard/proguard-support-v7-appcompat.pro" />
    <#if includeRetrofit>
        <instantiate from="root/proguard/proguard-okhttp3.pro.ftl"
                      to="${escapeXmlAttribute(projectOut)}/proguard/proguard-okhttp3.pro" />
        <instantiate from="root/proguard/proguard-square-retrofit2.pro.ftl"
                      to="${escapeXmlAttribute(projectOut)}/proguard/proguard-square-retrofit2.pro" />
        <instantiate from="root/proguard/proguard-okio.pro.ftl"
                      to="${escapeXmlAttribute(projectOut)}/proguard/proguard-okio.pro" />
        <instantiate from="root/proguard/proguard-moshi.pro.ftl"
                      to="${escapeXmlAttribute(projectOut)}/proguard/proguard-moshi.pro" />
    </#if>


    <#-- init AndroidManifest -->
    <merge from="root/AndroidManifest.xml.ftl"
                  to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />



    <#-- init base Classes -->
    <instantiate from="root/src/app_package/ActivityScope.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/annotations/ActivityScope.kt" />
    <instantiate from="root/src/app_package/ViewModelKey.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/annotations/ViewModelKey.kt" />
    <instantiate from="root/src/app_package/ApiModules.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/di/ApiModules.kt" />
    <instantiate from="root/src/app_package/ApplicationModule.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/di/ApplicationModule.kt" />
    <instantiate from="root/src/app_package/BindingModules.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/di/BindingModules.kt" />
    <instantiate from="root/src/app_package/Injectable.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/di/Injectable.kt" />
    <instantiate from="root/src/app_package/ViewModelFactory.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/di/ViewModelFactory.kt" />
    <instantiate from="root/src/app_package/RootComponent.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/di/RootComponent.kt" />
    <instantiate from="root/src/app_package/BasePresenter.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/commons/BasePresenter.kt" />
    <instantiate from="root/src/app_package/BaseView.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/commons/BaseView.kt" />
    <instantiate from="root/src/app_package/ExecutionThreads.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/commons/ExecutionThreads.kt" />
    <instantiate from="root/src/app_package/IoUseCase.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/commons/IoUseCase.kt" />
    <instantiate from="root/src/app_package/RepositoryModules.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/di/RepositoryModules.kt" />
    <instantiate from="root/src/app_package/RootApplication.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${appClassName}.kt" />
    <instantiate from="root/src/app_package/InputOnlyUseCase.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/commons/InputOnlyUseCase.kt" />
    <instantiate from="root/src/app_package/OutputOnlyUseCase.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/commons/OutputOnlyUseCase.kt" />
    <instantiate from="root/src/app_package/SimpleUseCase.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/commons/SimpleUseCase.kt" />
    <instantiate from="root/src/app_package/UseCase.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/commons/UseCase.kt" />
    <instantiate from="root/src/app_package/Activity.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/extensions/Activity.kt" />
    <instantiate from="root/src/app_package/Fragment.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/extensions/Fragment.kt" />
    <instantiate from="root/src/app_package/LiveDataReactiveStreams.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/utils/extensions/LiveDataReactiveStreams.kt" />

    <#if includeRealm>
        <instantiate from="root/src/app_package/Observable.kt.ftl"
                      to="${escapeXmlAttribute(srcOutKotlin)}/utils/extensions/Observable.kt" />
    </#if>

    <#-- init base res -->
    <instantiate from="root/res/layout/base_activity.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/base_activity.xml" />
    <open file="${escapeXmlAttribute(projectOut)}/build.gradle" />

</recipe>
