package com.example.presentation.presenter.main

import androidx.lifecycle.ViewModel
import com.example.presentation.utils.annotations.ViewModelKey
import dagger.Binds
import dagger.Module
import dagger.android.ContributesAndroidInjector
import dagger.multibindings.IntoMap

@Module
abstract class CleanArchMainModule {
    @Binds
    @IntoMap
    @ViewModelKey(CleanArchMainPresenterViewModel::class)
    abstract fun bindCleanArchMainPresenterViewModel(viewModel: CleanArchMainPresenterViewModel): ViewModel

    @ContributesAndroidInjector
    abstract fun contributeCleanArchMainFragment(): CleanArchMainFragment
}
