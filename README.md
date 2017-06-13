# Android-Studio-CleanArchitecture-template-forKotlin
This is an Android-Studio Template for CleanArchitecture Template & **Kotlin**

This repository is made with reference to  [Android-Studio-MVP-template](https://github.com/benoitletondor/Android-Studio-MVP-template). So, the repository configuration is similar.

It is inspired [Android-CleanArchitecture](https://github.com/android10/Android-CleanArchitecture)

Here's the hierarchy it follows:
```
com.company.app
    +--- data
    |     - datasource
    |     - entity
    |     - RepositoryModules
    |
    +--- domain
    |
    +--- presenter
    |
    +--- utils
    |     +--- annotations
    |     |     - ActivityScope
    |     |
    |     +--- commons
    |     |     - BasePresenter
    |     |     - BaseView
    |     |     - DefaultDisposableObserver
    |     |     - ExecutionThreads
    |     |     - InputOnlyUseCase
    |     |     - IoUseCase
    |     |     - OutputOnlyUseCase
    |     |     - SimpleUseCase
    |     |     - UseCase
    |     |
    |     +--- exceptions
    |
    | - ApiModules
    | - ApplicationModule
    | - MainApplication
    | - RootComponent

res
 +--- layout
 |    - base_activity.xml
```

## Prerequisites
You must satisfy the following conditions.

- [Kotlin](https://kotlinlang.org/)**(Recommended to use [Android-Studio 3.0](https://developer.android.com/studio/preview/index.html))**
- [Dagger2](https://google.github.io/dagger/) for dependency injection
- [RxJava2](https://github.com/ReactiveX/RxJava) for Asynchronous processing.
- [KotterKnife](https://github.com/JakeWharton/kotterknife) for View Initialization (**Non-essential but Recommended**)

## Installation

#### For Mac:

- If you have a standard Android Studio installation:

Just run the install script at the root of this repository:

```
./install.sh
```

- Manual installation:

Just copy all 5 directories
- `BaseCleanArchitectureTemplateKotlin`
- `DataTemplateKotlin`
- `DomainTemplateKotlin`
- `PresenterActivityTemplateKotlin`
- `PresenterServiceTemplateKotlin`

and paste to `$ANDROID_STUDIO_FOLDER$/Contents/plugins/android/lib/templates/activities/`

#### For Windows:

Just copy all 5 directories
- `BaseCleanArchitectureTemplateKotlin`
- `DataTemplateKotlin`
- `DomainTemplateKotlin`
- `PresenterActivityTemplateKotlin`
- `PresenterServiceTemplateKotlin`

and paste to  `$ANDROID_STUDIO_FOLDER$\plugins\android\lib\templates\activities\`

## How to Use
#### 1. Generate Base template
First of all, create the base hierarchy and classes using `CleanArchitectureTemplate` from the **root package folder**. This needs to be done only once per project:
![CleanArchitectureTemplate](static/selectBaseTemplate.png "BaseCleanArchitectureTemplateKotlin")

Or if you create a new project, please select `CleanArchitectureTemplate` on this screen
![CleanArchitectureTemplate](static/createNewPrj.png "BaseCleanArchitectureTemplateKotlin")

Next, you set project config.
- **Application Class Name** -> Set Root ApplicationClass Name
- **Create kotlin src dir?** -> Please check if you have not previously created the kotlin folder
- **Need Realm?** -> Please check this when using [Realm](https://realm.io/)
- **Need Retrofit2?** -> Please check this when using  [Retrofit2](http://square.github.io/retrofit/)
- **Use Swagger?** -> Please check this if the Retrofit API was created by [Swagger](http://swagger.io/)(RxJava2 used)

![Project Config](static/configPrj.png "Project Config")

When all settings are completed click the Finish button!!

#### 2. Fix build.gradle
If you get folloing error, fix root/build.gradle.
![Gradle Error](static/gradleError.png "gradle Error")

```
buildscript {
-    ext.kotlin_version = '1.1.2-3'
+    ext.kotlin_version = '1.1.2-4'
    repositories {
        maven { url 'https://maven.google.com' }
        jcenter()
    }
```

By the way, this error has already been discussed in [Stack Over Flow](https://stackoverflow.com/questions/44042754/android-studio-3-0-unable-to-find-method-com-android-build-gradle-internal-va)



**Some time, app/build.gradle file will also be broken...(WANTED  Info)**.
So, Please correct the file as follows.
```
- apply {
-     plugin: 'com.android.application'
-     plugin: 'realm-android'
- }
-
- apply {
-     plugin: 'kotlin-android'
-     plugin: 'kotlin-kapt'
- }

+ apply plugin: 'com.android.application'
+ apply plugin: 'realm-android'
+ apply plugin: 'kotlin-android'
+ apply plugin: 'kotlin-kapt'
```

### Use CleanArchitecture Template
Some templates need your work.

#### DataTemplateKotlin
This template create data-layer template.
![dataLayerTemplate](static/dataTemplate.png "dataTemplate")

This template will add DataSourceClass and DataRepositoryClass.

And then, please see DataSourceClass.The following notice is written there.
```
/*    FIXME MUST add below method to RepositoryModules */
//    @Provides fun provideMainDataSource(repository: MainRepository): MainDataSource = repository
```

So, Copy `@Provides fun provideMainDataSource(repository: MainRepository): MainDataSource = repository` to `RepositoryModules`


This Layer Provide Interface to domain.


#### DomainTemplateKotlin
This template create domain-layer template.
![domainUsecaseTemplate](static/domainUsecaseTemplate.png)

This template will add IoUsecaseClass or InputOnlyUseCaseClass or OutputOnlyUseCaseClass or SimpleUseCaseClass.

This Layer Provide Bussiness Logic and connect DataLayer to PresentationLayer.


#### PresenterActivityTemplateKotlin
This template create presenter-layer template.
![presenterActivityTemplate](static/presenterActivityTemplate.png)

This template will add ComponentClass, ContractClass, ModuleClass, PresenterClass, ActivityClass and FragmentClass.

And then, please see ActivityClass. The following notice is written there.
```
/* FIXME 1st:MUST add below method to RootComponent */
// fun new${componentName}(module: ${moduleName}): ${componentName}

/* FIXME 2nd:initialize ${componentName} like this */
(application as MainApplication).rootComponent
.new${componentName}(${moduleName}(fragment as ${contractName}.View)).inject(fragment)
```

So, Copy `fun newMainComponent(module: MainModule): MainComponent` to `RootComponent`

This Layer Provides UserInterface(Activity & Fragment).
And presenterClass communicate domain-layer.

#### PresenterServiceTemplateKotlin
This template create presenter-layer template.
![presenterServiceTemplate](static/presenterServiceTemplate.png)

This template will add ComponentClass, ContractClass, ModuleClass, PresenterClass and ServiceClass.

And then, please see ActivityClass. The following notice is written there.
```
/* FIXME 1st:MUST add below method to RootComponent */
// fun newMainComponent(module: MainModule): MainComponent

/* FIXME 2nd:initialize MainComponent like this */
(application as MainApplication).rootComponent
        .newMainComponent(MainModule(this)).inject(this)
```

So, Copy `fun newMainComponent(module: MainModule): MainComponent` to `RootComponent`

This Layer Provides UserInterface(Service).
And presenterClass communicate domain-layer.

## Example
Very simple example is in the Example folder.
