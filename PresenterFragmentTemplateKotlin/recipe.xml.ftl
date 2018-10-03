<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/SimpleContract.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${contractName}.kt" />
    <instantiate from="root/src/app_package/SimplePresenterViewModel.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${presenterViewModelName}.kt" />
    <instantiate from="root/src/app_package/SimpleFragment.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${fragmentName}.kt" />
    <instantiate from="root/res/layout/fragment_simple.xml.ftl"
                  to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${contractName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${presenterViewModelName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${fragmentName}.kt" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
  </recipe>
