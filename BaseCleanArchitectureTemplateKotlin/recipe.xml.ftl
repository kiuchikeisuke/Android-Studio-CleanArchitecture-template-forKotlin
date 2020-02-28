<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <!-- init buildSrc -->
    <mkdir at="${escapeXmlAttribute(topOut)}/buildSrc/src"/>
    <mkdir at="${escapeXmlAttribute(topOut)}/buildSrc/src/main"/>
    <mkdir at="${escapeXmlAttribute(topOut)}/buildSrc/src/main/kotlin"/>
    <instantiate from="root/src/buildSrc/android-application.gradle.kts.ftl"
             to="${escapeXmlAttribute(topOut)}/buildSrc/src/main/kotlin/android-application.gradle.kts" />
    <instantiate from="root/src/buildSrc/build.gradle.kts.ftl"
             to="${escapeXmlAttribute(topOut)}/buildSrc/build.gradle.kts" />
    <instantiate from="root/src/buildSrc/common-library.gradle.kts.ftl"
            to="${escapeXmlAttribute(topOut)}/buildSrc/src/main/kotlin/common-library.gradle.kts" />
    <instantiate from="root/src/buildSrc/Dependencies.kt.ftl"
            to="${escapeXmlAttribute(topOut)}/buildSrc/src/main/kotlin/Dependencies.kt" />
    <instantiate from="root/src/buildSrc/settings.gradle.kts.ftl"
            to="${escapeXmlAttribute(topOut)}/buildSrc/settings.gradle.kts" />

    <open file="${escapeXmlAttribute(topOut)}/buildSrc/src/main/kotlin/android-application.gradle.kts" />
    <open file="${escapeXmlAttribute(topOut)}/buildSrc/src/main/kotlin/common-library.gradle.kts" />
    <open file="${escapeXmlAttribute(topOut)}/buildSrc/src/main/kotlin/Dependencies.kt" />
    <open file="${escapeXmlAttribute(topOut)}/buildSrc/build.gradle.kts" />

    <!-- init build.gradle -->
    <@kt.addAllKotlinDependencies />
    <instantiate from="root/build.gradle.ftl"
             to="${escapeXmlAttribute(projectOut)}/FIXME_merge_to_build.gradle" />
    <open file="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <open file="${escapeXmlAttribute(projectOut)}/FIXME_merge_to_build.gradle" />

    <!-- init proguard -->
    <mkdir at="${escapeXmlAttribute(topOut)}/proguard" />
    <instantiate from="root/proguard/proguard-google-dagger2.pro.ftl"
                  to="${escapeXmlAttribute(topOut)}/proguard/proguard-google-dagger2.pro" />
    <instantiate from="root/proguard/proguard-rx-java.pro.ftl"
                  to="${escapeXmlAttribute(topOut)}/proguard/proguard-rx-java.pro" />
    <instantiate from="root/proguard/proguard-rx-java2.pro.ftl"
                  to="${escapeXmlAttribute(topOut)}/proguard/proguard-rx-java2.pro" />
    <instantiate from="root/proguard/proguard-support-design.pro.ftl"
                  to="${escapeXmlAttribute(topOut)}/proguard/proguard-support-design.pro" />
    <instantiate from="root/proguard/proguard-support-v7-appcompat.pro.ftl"
                  to="${escapeXmlAttribute(topOut)}/proguard/proguard-support-v7-appcompat.pro" />
    <#if includeRetrofit>
        <instantiate from="root/proguard/proguard-okhttp3.pro.ftl"
                      to="${escapeXmlAttribute(topOut)}/proguard/proguard-okhttp3.pro" />
        <instantiate from="root/proguard/proguard-square-retrofit2.pro.ftl"
                      to="${escapeXmlAttribute(topOut)}/proguard/proguard-square-retrofit2.pro" />
        <instantiate from="root/proguard/proguard-moshi.pro.ftl"
                      to="${escapeXmlAttribute(topOut)}/proguard/proguard-moshi.pro" />
    </#if>
    <!-- init AndroidManifest -->
    <merge from="root/AndroidManifest.xml.ftl"
                  to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <!-- init base Classes -->
    <#if createKotlinDir>
      <mkdir at="${escapeXmlAttribute(projectOut)}/src/androidTest/kotlin"/>
      <mkdir at="${escapeXmlAttribute(projectOut)}/src/main/kotlin"/>
      <mkdir at="${escapeXmlAttribute(projectOut)}/src/test/kotlin"/>
    </#if>
    <mkdir at="${escapeXmlAttribute(projectOut)}/src/test/resources" />
    <mkdir at="${escapeXmlAttribute(projectOut)}/src/test/resources/mockito-extensions" />
    <!-- init base res -->
    <instantiate from="root/res/layout/base_activity.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/base_activity.xml" />

    <!-- init base Classes For app module -->
    <instantiate from="root/src/app_package/RootApplication.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${appClassName}.kt" />
    <instantiate from="root/src/app_package/RootComponent.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/RootComponent.kt" />
    <instantiate from="root/src/app_package/ApplicationModule.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/ApplicationModule.kt" />

    <!-- init base Classes For presenter module -->
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/presenter"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/annotations"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/commons"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/di"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/exceptions"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/extensions"/>
    <instantiate from="root/src/app_package/BindingModules.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/BindingModules.kt" />
    <instantiate from="root/src/app_package/ActivityScope.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/annotations/ActivityScope.kt" />
    <instantiate from="root/src/app_package/ViewModelKey.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/annotations/ViewModelKey.kt" />
    <instantiate from="root/src/app_package/BaseView.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/commons/BaseView.kt" />
    <instantiate from="root/src/app_package/BasePresenter.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/commons/BasePresenter.kt" />
    <instantiate from="root/src/app_package/ViewModelFactory.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/commons/ViewModelFactory.kt" />
    <instantiate from="root/src/app_package/Injectable.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/di/Injectable.kt" />
    <instantiate from="root/src/app_package/LiveDataReactiveStreams.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/extensions/LiveDataReactiveStreams.kt" />
    <instantiate from="root/src/app_package/Fragment.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/extensions/Fragment.kt" />
    <instantiate from="root/src/app_package/Activity.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/presenter/utils/extensions/Activity.kt" />

    <!--  init base Classes For domain module -->
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/domain"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/domain/entity"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/domain/repository"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/domain/usecase"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/domain/utils"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/domain/utils/commons"/>
    <instantiate from="root/src/app_package/UseCaseModules.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/domain/UseCaseModules.kt" />
    <instantiate from="root/src/app_package/UseCase.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/domain/utils/commons/UseCase.kt" />
    <instantiate from="root/src/app_package/ExecutionThreads.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/domain/utils/commons/ExecutionThreads.kt" />

    <!--  init base Classes For data module -->
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/data"/>
    <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/data/datasource"/>
    <instantiate from="root/src/app_package/RepositoryModules.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/data/RepositoryModules.kt" />
    <instantiate from="root/src/app_package/ApiModules.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/data/ApiModules.kt" />
    <#if includeRealm>
      <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/data/utils"/>
      <mkdir at="${escapeXmlAttribute(srcOutKotlin)}/data/utils/extensions"/>
      <instantiate from="root/src/app_package/Observable.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/data/utils/extensions/Observable.kt" />
    </#if>

    <!-- init mockito setting -->
    <instantiate from="root/src/test_package/org.mockito.plugins.MockMaker.ftl"
                  to="${escapeXmlAttribute(projectOut)}/src/test/resources/mockito-extensions/org.mockito.plugins.MockMaker" />

</recipe>
