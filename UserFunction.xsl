<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2001/XMLSchema/Amrendra"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs fn math"
    version="2.0">

<!-- https://xsltfiddle.liberty-development.net/6pS2B6D -->
    <xsl:output omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <root>
            <table>
                <xsl:value-of select="fn:print-table(10)"/>
            </table>
            <areaofcirc>
                <xsl:value-of
                    select="concat('Area of ', 12, ' redius circle is: ', (fn:circArea(12)))"
                />
            </areaofcirc>
        </root>
    </xsl:template>

    <xsl:function name="fn:circArea">
        <xsl:param name="r"/>
        <xsl:value-of select="math:pi() * ($r * $r)"/>
    </xsl:function>

    <xsl:function name="fn:print-table">
        <xsl:param name="num" as="xs:integer"/>
        <xsl:for-each select="1 to 10">
            <xsl:value-of
                select="concat($num, ' * ', number(.), ' = ', ($num * number(.)), '&#x0a;')"/>
        </xsl:for-each>
    </xsl:function>

</xsl:stylesheet>
