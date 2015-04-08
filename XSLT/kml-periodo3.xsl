<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.opengis.net/kml/2.2"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <kml>
            <Document>
                <name>1240-1300</name>
                <xsl:apply-templates select="//person[floruit/@period='3']"/>
            </Document>
        </kml>        
    </xsl:template>
    <xsl:template match="persName"/>
    <xsl:template match="affiliation">
        <Placemark>
            <name><xsl:value-of select="preceding-sibling::persName"/></name>
            <description><xsl:value-of select="current()/text()[1]"/></description>
            <Style>
                <IconStyle>
                    <xsl:choose>
                        <xsl:when test="current()/@n = 'predio'">
                            <Icon>
                                <href>http://maps.google.com/mapfiles/kml/pal2/icon3.png</href>
                            </Icon>
                        </xsl:when>
                        <xsl:otherwise>
                            <Icon>
                                <href>http://maps.google.com/mapfiles/kml/pal4/icon17.png</href>
                            </Icon>
                        </xsl:otherwise>
                    </xsl:choose>
                </IconStyle>
            </Style>
            <Point>
                <coordinates><xsl:value-of select="current()/concat(string-join(
                    (substring-after(geo, ','),
                    substring-before(geo, ','))
                    , ','), ',100')"></xsl:value-of></coordinates>
            </Point>
        </Placemark>
    </xsl:template>
</xsl:stylesheet>
