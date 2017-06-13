<?xml version="1.0"?>
<recipe>

    <instantiate from="root/src/app_package/UseCase.kt.ftl"
                   to="${escapeXmlAttribute(srcOutKotlin)}/${useCaseName}.kt" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${useCaseName}.kt" />
</recipe>
