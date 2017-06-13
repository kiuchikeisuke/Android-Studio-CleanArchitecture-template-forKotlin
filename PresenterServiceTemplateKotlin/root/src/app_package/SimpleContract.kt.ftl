package ${packageName}
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.BaseView
import ${applicationPackage}.utils.commons.BasePresenter
</#if>

interface ${contractName} {
    interface View: BaseView {

    }

    interface Presenter: BasePresenter {

    }
}
