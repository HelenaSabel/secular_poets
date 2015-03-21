<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.opengis.net/kml/2.2"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <kml>
            <Document>
                <xsl:apply-templates select="//ul"/>
            </Document>
        </kml>
    </xsl:template>
    <xsl:template match="li">
        <Placemark>
            <name><xsl:value-of select="toponimo"/></name>
            <description>
                <xsl:text>Cantiga "</xsl:text>
                <xsl:value-of select="cantiga"/>
                <xsl:text>" de </xsl:text>
                <xsl:value-of select="autor"/>
            </description>
            <Point>
                <coordinates><xsl:value-of select="coor"/></coordinates>
            </Point>
        </Placemark>
    </xsl:template>
</xsl:stylesheet>