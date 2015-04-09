<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.opengis.net/kml/2.2"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="Placemark">
        <xsl:value-of
            select="description"
        />
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>