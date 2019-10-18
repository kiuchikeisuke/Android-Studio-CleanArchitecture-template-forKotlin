<?xml version="1.0"?>
<recipe>
    <merge from="root/AndroidManifest.xml.ftl"
                  to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <instantiate from="root/src/app_package/SimpleContract.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${contractName}.kt" />
    <instantiate from="root/src/app_package/SimpleModule.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${moduleClassName}.kt" />
    <instantiate from="root/src/app_package/SimplePresenter.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${presenterName}.kt" />
    <instantiate from="root/src/app_package/SimpleReceiver.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${receiverName}.kt" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${moduleClassName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${contractName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${presenterName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${receiverName}.kt" />
</recipe>
