<manifest xmlns:android="http://schemas.android.com/apk/res/android" >
    <#if includeRetrofit>
       <uses-permission android:name="android.permission.INTERNET"/>
    </#if>
    <application
       android:name="${packageName}.${appClassName}"
    >
    </application>

</manifest>
