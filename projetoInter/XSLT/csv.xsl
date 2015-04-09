<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="persName"/>
    <xsl:template match="affiliation">
            <xsl:value-of
                select="concat(preceding-sibling::persName, ';', preceding-sibling::floruit/@period, ';', current()/text()[1], ';', @n)"
            />
        </xsl:template>
</xsl:stylesheet>
