<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:variable name="places" select="doc('common-affiliations.xml')//place"/>
    <xsl:variable name="people" select="//person"/>
    <xsl:template match="TEI">
        <xsl:apply-templates select="//person"/>
    </xsl:template>
    <xsl:template match="persName"/>
    <xsl:template match="affiliation[@n = 'geo']"/>
    <xsl:template match="affiliation[@n = 'predio']"/>
    <xsl:template match="affiliation[@n = 'social']">
        <xsl:choose>
            <xsl:when test="matches(@corresp, '#[a-z]')">
                <xsl:value-of
                    select="
                        concat(preceding-sibling::persName, ';', @key, ';',
                        preceding-sibling::floruit/@period, ';',
                        $places[@xml:id = substring(current()/@corresp, 2)]/location/placeName[@type = 'short'], ';', $places[@xml:id = substring(current()/@corresp, 2)]/@type)"
                />
            </xsl:when>
            <xsl:when test="matches(@corresp, '#[A-Z]')">
                <xsl:value-of
                    select="
                        concat(preceding-sibling::persName, ';', @key, ';',
                        preceding-sibling::floruit/@period, ';',
                        $people[@xml:id = substring(current()/@corresp, 2)]/persName, ';','trovador')"
                />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of
                    select="
                        concat(preceding-sibling::persName, ';', @key, ';',
                        preceding-sibling::floruit/@period, ';',
                        current()/text()[1], ';','noble')"
                />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
