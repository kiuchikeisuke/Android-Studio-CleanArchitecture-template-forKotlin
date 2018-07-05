<?xml version="1.0"?>
<recipe>

    <instantiate from="root/src/app_package/SimpleRepository.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${dataRepositoryName}.kt" />
    <instantiate from="root/src/app_package/SimpleDataStore.kt.ftl"
                   to="${escapeXmlAttribute(srcOutKotlin)}/${dataStoreName}.kt" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${dataRepositoryName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${dataStoreName}.kt" />
</recipe>
