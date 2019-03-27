<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:template match="/">
        <xsl:variable name="Premium" select="/transaction/actual_premium"/>
        <root>
            
            <xsl:try>
                <xsl:value-of select="format-number($Premium, '###,###,###')"/>
                <xsl:catch>Error code: <xsl:value-of select="$err:code"/>
                    Reason: <xsl:value-of select="$err:description"/>
                </xsl:catch>
            </xsl:try>
            
        </root>
    </xsl:template>
    
</xsl:stylesheet>