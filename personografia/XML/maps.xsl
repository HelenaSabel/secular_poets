<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.opengis.net/kml/2.2"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="places" select="doc('common-affiliations.xml')//place"/>
    <xsl:template match="/">
        <xsl:result-document href="../KML/period1.kml">
            <kml>
                <Document>
                    <name>1170-1220</name>
                    <xsl:apply-templates select="//person[floruit/@period='1']"/>
                    <xsl:apply-templates select="$places[contains(@n,'1')]"/>
                </Document>
            </kml>             
        </xsl:result-document>
        <xsl:result-document href="../KML/period2.kml">
            <kml>
                <Document>
                    <name>1220-1240</name>
                    <xsl:apply-templates select="//person[floruit/@period='2']"/>
                    <xsl:apply-templates select="$places[contains(@n,'2')]"/>
                </Document>
            </kml>             
        </xsl:result-document>
        <xsl:result-document href="../KML/period3.kml">
            <kml>
                <Document>
                    <name>1240-1300</name>
                    <xsl:apply-templates select="//person[floruit/@period='3']"/>
                    <xsl:apply-templates select="$places[contains(@n,'3')]"/>
                </Document>
            </kml>             
        </xsl:result-document>
        <xsl:result-document href="../KML/period4.kml">
            <kml>
                <Document>
                    <name>1300-1350</name>
                    <xsl:apply-templates select="//person[floruit/@period='4']"/>
                    <xsl:apply-templates select="$places[contains(@n,'4')]"/>
                </Document>
            </kml>             
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="persName"/>
    <xsl:template match="affiliation[@key='mecenado'][not(@corresp)]"/>
    <xsl:template match="affiliation[@key='politica']"/>
    <xsl:template match="affiliation[@key='literaria']"/>
    <xsl:template match="affiliation[@key='familia']"/>
    <xsl:template match="affiliation[@key='origem']">
        <Placemark>
            <name><xsl:value-of select="preceding-sibling::persName"/></name>
            <description>
                <xsl:choose>
                    <xsl:when test="@corresp">
                        <xsl:value-of select="$places[@xml:id = substring(current()/@corresp,2)]//placeName[@type='full']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="current()/text()[1]"/>
                    </xsl:otherwise>
                </xsl:choose>
            </description>
            <Style>
                <IconStyle>
                    <Icon>
                        <href>http://www.obdurodon.org/~heb43/images/poet3.png</href>
                    </Icon>
                </IconStyle>
            </Style>
            <Point>
                <coordinates>
                    <xsl:choose>
                        <xsl:when test="@corresp">
                            <xsl:value-of select="$places[@xml:id = substring(current()/@corresp,2)]
                                /location/concat(string-join(
                                (substring-after(geo, ','),
                                substring-before(geo, ','))
                                , ','), ',100')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="current()/concat(string-join(
                                (substring-after(geo, ','),
                                substring-before(geo, ','))
                                , ','), ',100')"></xsl:value-of>
                        </xsl:otherwise>
                    </xsl:choose>
                </coordinates>
            </Point>
        </Placemark>
    </xsl:template>
    <xsl:template match="affiliation[@key='mecenado'][@corresp]">
        <Placemark>
            <name>Trajeto de <xsl:value-of select="preceding-sibling::persName"/></name>
            <Style>
                <LineStyle>
                    <color>50000000</color>
                    <width>4</width>
                </LineStyle>
            </Style>
            <LineString>
                <coordinates>
                    <xsl:choose>
                        <xsl:when test="..//affiliation[@key='origem'][1]/@corresp">
                            <xsl:value-of select="$places[@xml:id = substring(current()/..//affiliation[@key='origem'][1]/@corresp,2)]
                                /location/concat(string-join(
                                (substring-after(geo, ','),
                                substring-before(geo, ','))
                                , ','), ',100')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="..//affiliation[@key='origem'][1]/concat(string-join(
                                (substring-after(geo, ','),
                                substring-before(geo, ','))
                                , ','), ',100')"></xsl:value-of>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$places[@xml:id = substring(current()/@corresp,2)]
                        /location/concat(string-join(
                        (substring-after(geo, ','),
                        substring-before(geo, ','))
                        , ','), ',100')"/>
                </coordinates>
            </LineString>
        </Placemark>
    </xsl:template>
    <xsl:template match="place">
        <Placemark>
            <name><xsl:value-of select="current()//placeName[@type='short']"/></name>
            <description><xsl:value-of select="current()//placeName[@type='full']"/></description>
            <xsl:if test="@type='royal'">
            <Style>
                <IconStyle>
                    <Icon>
                        <href>http://www.obdurodon.org/~heb43/images/king.png</href>
                    </Icon>
                </IconStyle>
            </Style>
            </xsl:if>
            <xsl:if test="@type='noble'">
                <Style>
                    <IconStyle>
                        <Icon>
                            <href>http://www.obdurodon.org/~heb43/images/lord.png</href>
                        </Icon>
                    </IconStyle>
                </Style>
            </xsl:if>
            <Point>
                <coordinates>
                    <xsl:value-of select="current()/location/concat(string-join(
                        (substring-after(geo, ','),
                        substring-before(geo, ','))
                        , ','), ',100')"/>
                </coordinates>
            </Point>
        </Placemark>
    </xsl:template>
</xsl:stylesheet>
