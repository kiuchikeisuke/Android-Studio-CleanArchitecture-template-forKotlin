<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="${packageName}">
    <#if includeRetrofit>
       <uses-permission android:name="android.permission.INTERNET"/>
    </#if>
    <application
       android:name="${packageName}.${appClassName}"
       />
</manifest>
