<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output indent="yes"/>

    <xsl:variable name="month-index" select="'January:01', 'February:02', 'March:03', 'April:04', 'May:05', 'Jun:06', 'July:07', 'August:08', 'September:09', 'October:10', 'November:11', 'December:12'"/>

    <!-- https://xsltfiddle.liberty-development.net/3Mvnt3A -->
    <xsl:template match="/">
        <root>
            <date>
                <day>
                    <xsl:value-of select="substring(string(current-date()), 9, 2)"/>
                </day>
                <month monthnum="{substring-after($month-index[number(substring(string( current-date() ),6,2))], ':')}">
                    <xsl:value-of select="substring-before($month-index[number(substring(string(current-date()), 6, 2))], ':')" />
                </month>
                <year>
                    <xsl:value-of select="substring(string(current-date()), 0, 5)"/>
                </year>
            </date>
        </root>
    </xsl:template>

</xsl:stylesheet>
