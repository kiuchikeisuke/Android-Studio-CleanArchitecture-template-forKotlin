<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
  <@kt.addAllKotlinDependencies />
    <instantiate from="root/src/app_package/SimpleContract.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${contractName}.kt" />
    <instantiate from="root/src/app_package/SimpleModule.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${moduleClassName}.kt" />
    <instantiate from="root/src/app_package/SimplePresenter.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${presenterName}.kt" />
    <instantiate from="root/src/app_package/SimpleFragment.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${fragmentName}.kt" />
    <instantiate from="root/res/layout/fragment_simple.xml.ftl"
                  to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${contractName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${moduleClassName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${presenterName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${fragmentName}.kt" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
  </recipe>
