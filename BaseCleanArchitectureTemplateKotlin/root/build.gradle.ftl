/* 1st:Merge below settings to app's build.gradle
   2nd:Remove this file !!  */

<#compress>
// FIXME add below to file top
apply plugin: "com.github.konifar.gradle.unused-resources-remover"
<#if includeRealm>
apply plugin: 'realm-android'
</#if>
</#compress>

// FIXME add below to file end!
configurations.all {
    //FIXME replace version to SAME support Library Version!!
    resolutionStrategy.force "com.android.support:support-annotations:+"
}

// FIXME add below to file end!
clean.dependsOn(removeUnusedResources)
