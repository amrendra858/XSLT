<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">

    <xsl:output method="xml" indent="yes"/>
    
    <!-- Reference Link:  https://xsltfiddle.liberty-development.net/pNmCzsR -->

    <xsl:template match="/">
        <root>
            <comma_seperated>
                <xsl:call-template name="abc">
                    <xsl:with-param name="text" select="'Hi,this,is,summer.'"/>
                    <xsl:with-param name="seperator" select="','"/>
                </xsl:call-template>
            </comma_seperated>
            <has_seperated>
                <xsl:call-template name="abc">
                    <xsl:with-param name="text" select="'Hi#this#is#summer.'"/>
                    <xsl:with-param name="seperator" select="'#'"/>
                </xsl:call-template>
            </has_seperated>

        </root>
    </xsl:template>

    <xsl:template name="abc">
        <xsl:param name="text"/>
        <xsl:param name="seperator"/>
        <xsl:choose>
            <xsl:when test="contains($text, $seperator)">
                <target>
                    <xsl:value-of select="substring-before($text, $seperator)"/>
                </target>
                <xsl:call-template name="abc">
                    <xsl:with-param name="text" select="substring-after($text, $seperator)"/>
                    <xsl:with-param name="seperator" select="$seperator"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <target>
                    <xsl:value-of select="$text"/>
                </target>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

