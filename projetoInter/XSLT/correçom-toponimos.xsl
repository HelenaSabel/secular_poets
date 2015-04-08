<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.opengis.net/kml/2.2"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.opengis.net/kml/2.2"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="Placemark/name">
        <xsl:element name="name">
            <xsl:value-of select="substring-after(following-sibling::description, '&quot; de ')"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="description">
        <xsl:element name="description">
            <xsl:value-of select="concat(preceding-sibling::name, ', que aparece na ', current())"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>