<?xml version="1.0"?>
<recipe>

    <instantiate from="root/src/app_package/SimpleDataSource.kt.ftl"
                   to="${escapeXmlAttribute(srcOutKotlin)}/${dataSourceName}.kt" />
    <instantiate from="root/src/app_package/SimpleRepository.kt.ftl"
                  to="${escapeXmlAttribute(srcOutKotlin)}/${dataRepositoryName}.kt" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${dataSourceName}.kt" />
    <open file="${escapeXmlAttribute(srcOutKotlin)}/${dataRepositoryName}.kt" />
</recipe>
