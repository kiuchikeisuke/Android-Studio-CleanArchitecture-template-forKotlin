package ${packageName}
<#if applicationPackage??>
import ${applicationPackage}.presenter.utils.commons.BaseView
import ${applicationPackage}.presenter.utils.commons.BasePresenter
</#if>
interface ${contractName} {

    interface View : BaseView {

    }

    interface Presenter : BasePresenter {

    }
}
