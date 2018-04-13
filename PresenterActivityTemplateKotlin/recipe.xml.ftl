<?xml version="1.0"?>
<recipe>
    <merge from="root/AndroidManifest.xml.ftl"
                  to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <instantiate from="root/src/app_package/SimpleContract.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${contractName}.kt" />
    <instantiate from="root/src/app_package/SimpleModule.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${moduleName}.kt" />
    <instantiate from="root/src/app_package/SimplePresenterViewModel.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${presenterViewModelName}.kt" />
    <instantiate from="root/src/app_package/SimpleActivity.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${activityName}.kt" />
    <instantiate from="root/src/app_package/SimpleFragment.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${fragmentName}.kt" />
    <instantiate from="root/res/layout/fragment_simple.xml.ftl"
                  to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${contractName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${moduleName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${presenterViewModelName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${activityName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${fragmentName}.kt" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
  </recipe>
