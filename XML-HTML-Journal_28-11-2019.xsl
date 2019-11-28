<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs epub #default" version="2.0">
    <!--xpath-default-namespace="http://www.w3.org/1999/xhtml"-->

    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="article">
        <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
            <head>
                <title>
                    <xsl:apply-templates
                        select="front/article-meta/title-group/article-title/node()"/>
                </title>
                <link rel="stylesheet" type="text/css" href="stylesheet.css"/>
            </head>
            <body>
                <table class="tab1">
                    <tr>
                        <td class="left">
                            <img src="../images/logo1.jpg" alt="image"/>
                        </td>
                        <td class="right">
                            <a href="http://tremorjournal.org/">
                                <img src="../images/logo2.jpg" alt="image"/>
                            </a>
                        </td>
                    </tr>
                </table>
                <h3 class="paper-type">
                    <xsl:apply-templates
                        select="(front/article-meta/article-categories/subj-group/subject)[1]/node()"
                    />
                </h3>
                <h1 class="h1" id="h1">
                    <xsl:apply-templates
                        select="front/article-meta/title-group/article-title/node()"/>
                </h1>
                <xsl:apply-templates select="front/article-meta/contrib-group"/>

                <xsl:call-template name="make-abstract"/>

                <div class="white">
                    <p class="box-noindent">
                        <span class="spanlabel">
                            <xsl:apply-templates
                                select="front/article-meta/author-notes/corresp/node()"/>
                        </span>
                    </p>
                    <p class="box-noindent" style="background-color:yellow;">
                        <span class="green">Editor: </span>, Where to find editors details.</p>
                    <xsl:apply-templates select="front/article-meta/history"/>
                    <xsl:call-template name="make-permission"/>
                    <p class="box-noindent" style="background-color:yellow;">
                        <span class="spanlabel">Copyright: © </span>
                        <xsl:apply-templates
                            select="front/article-meta/permissions/copyright-year/node()"/>
                    </p>
                    <xsl:for-each select="back/fn-group/fn/p">
                        <p class="box-noindent">
                            <xsl:if test="parent::fn/@id[. != '']">
                                <xsl:attribute name="id" select="parent::fn/@id"/>
                            </xsl:if>
                            <xsl:apply-templates/>
                        </p>
                    </xsl:for-each>
                </div>
                <xsl:apply-templates select="body/sec"/>
                <xsl:apply-templates select="back/ack"/>
                <xsl:apply-templates select="back/ref-list"/>
                <div class="MoreLogos">
                    <table class="tab2">
                        <tr>
                            <td class="left">
                                <a href="http://tremorjournal.org/">
                                    <img class="TremorLogoSmall" title="Small Tremor"
                                        src="../images/logo3.jpg" alt="Small Tremor"/>
                                </a>
                            </td>
                            <td class="right">
                                <img class="CDRSLogo"
                                    title="Center for Digital Research and Scholarship"
                                    src="../images/logo4.jpg"
                                    alt="Center for Digital Research and Scholarship"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="contrib-group">
        <p class="author">
            <xsl:for-each select="contrib">
                <xsl:apply-templates select="node() except role"/>
                <xsl:choose>
                    <xsl:when test="position() = last()"/>
                    <xsl:when test="position() = last() - 1"> &amp; </xsl:when>
                    <xsl:otherwise>, </xsl:otherwise>
                </xsl:choose>

            </xsl:for-each>
        </p>
    </xsl:template>

    <xsl:template match="name[parent::contrib]">
        <xsl:apply-templates select="given-names/node()"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="surname/node()"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="node() except (given-names, surname)"/>
    </xsl:template>

    <xsl:template match="xref[@ref-type = 'bibr']">
        <sup>
            <!-- Multiple places citation are referenced so we can't cross refer the citation due to duplicate IDs  -->
            <!--<a href="{concat('#',  @rid)}" id="{concat(@rid, '-', .)}">-->
            <a href="{concat('#',  @rid)}">
                <xsl:apply-templates/>
            </a>
            <a href="{concat('#',  @rid)}"/>
            <xsl:if test="following-sibling::node()[1][self::xref[@ref-type = 'bibr']]">, </xsl:if>
        </sup>
    </xsl:template>

    <xsl:template match="fn/p/funding-source">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="xref[@ref-type = 'aff']">
        <sup>
            <a href="{concat('#',  @rid)}">
                <xsl:apply-templates/>
            </a>
            <a href="{concat('#',  @rid)}"/>
            <xsl:if test="following-sibling::node()[1][self::xref[@ref-type = 'aff']]">, </xsl:if>
        </sup>
    </xsl:template>

    <xsl:template match="xref">
        <a href="{concat('#',  @rid)}">
            <xsl:apply-templates/>
        </a>
        <a href="{concat('#',  @rid)}"/>
    </xsl:template>

    <xsl:template match="italic">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="bold">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    <xsl:template match="sub">
        <sub>
            <xsl:apply-templates/>
        </sub>
    </xsl:template>
    <xsl:template match="sup">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>

    <xsl:template match="sec/p/named-content">
        <span class="named-content">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template name="make-abstract">
        <div class="box">
            <xsl:if test="front/article-meta/abstract[. != '']">
                <p class="abstracttitle" id="abs">Abstract</p>
                <xsl:for-each select="front/article-meta/abstract/node()">
                    <xsl:apply-templates/>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="front/article-meta/kwd-group[. != '']">
                <xsl:call-template name="make-keywords"/>
            </xsl:if>
            <xsl:call-template name="make-citation"/>
        </div>
    </xsl:template>

    <xsl:variable name="months"
        select="'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'"/>

    <xsl:variable name="r-months" select="date[@date-type = 'received']/month"/>

    <xsl:template match="history">
        <p class="box-noindent">
            <span>Received:</span>
            <xsl:text> </xsl:text>
            <xsl:value-of
                select="
                    let $i := number(date[@date-type = 'received']/month)
                    return
                        $months[$i]"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="date[@date-type = 'received']/day"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="date[@date-type = 'received']/year"/>
            <xsl:text> </xsl:text>
            <span>Accepted:</span>
            <xsl:text> </xsl:text>
            <xsl:value-of
                select="
                    let $j := number(date[@date-type = 'accepted']/month)
                    return
                        $months[$j]"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="date[@date-type = 'accepted']/day"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="date[@date-type = 'accepted']/year"/>
        </p>
    </xsl:template>

    <xsl:template name="make-citation">
        <p class="citationinformation">
            <span>Citation: </span>
            <xsl:for-each select="front/article-meta/contrib-group/contrib">
                <xsl:for-each select="name[parent::contrib]">
                    <xsl:apply-templates select="given-names/node()"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="surname/node()"/>
                </xsl:for-each>
                <xsl:choose>
                    <xsl:when test="position() = last()"/>
                    <xsl:when test="position() = last() - 1"> and </xsl:when>
                    <xsl:otherwise>, </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:text>. </xsl:text>
            <xsl:apply-templates select="front/article-meta/title-group/article-title/node()"/>
            <xsl:text>. </xsl:text>
            <xsl:apply-templates
                select="front/journal-meta/journal-title-group/journal-title/node()"/>
            <xsl:if test="front/journal-meta/journal-title-group/journal-title != ''">
                <xsl:text>. </xsl:text>
            </xsl:if>
            
            <xsl:apply-templates select="front/article-meta/permissions/copyright-year/node()"/>
            <xsl:if test="front/article-meta/permissions/copyright-year[. != '']">
                <xsl:text>. </xsl:text>
            </xsl:if>
            
            <xsl:if test="front/article-meta/article-id[@pub-id-type = 'doi'] != ''">
                <xsl:text> doi:</xsl:text>
                <a
                    href="{concat('http://dx.doi.org/', front/article-meta/article-id[@pub-id-type='doi'])}"
                        ><xsl:value-of select="front/article-meta/article-id[@pub-id-type = 'doi']"
                    />.</a>
            </xsl:if>
        </p>
    </xsl:template>

    <xsl:template name="make-keywords">
        <p class="box-noindent-t">
            <span class="spanlabel">Keywords: </span>
            <xsl:for-each select="front/article-meta/kwd-group/kwd">
                <xsl:apply-templates/>
                <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>
        </p>
    </xsl:template>

    <xsl:template match="email[normalize-space()]">
        <a href="{concat('mailto:', .)}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template name="make-permission">
        <xsl:for-each select="front/article-meta/permissions/license/license-p">
            <xsl:variable name="lic" select="parent::license/@xlink:href"/>
            <p class="box-noindent">
                <xsl:analyze-string select="." regex="(License)">
                    <xsl:matching-substring>
                        <a rel="license" href="{$lic}">
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring>
                        <xsl:value-of select="."/>
                    </xsl:non-matching-substring>
                </xsl:analyze-string>
            </p>
        </xsl:for-each>
    </xsl:template>

    <!--<xsl:template match="body/sec">
        <span class="classsec0" id="{concat('sec1-', position())}">
            <xsl:apply-templates select="title/node()"/>
        </span>
        <xsl:apply-templates select="node() except title"/>
    </xsl:template>-->

    <xsl:template match="sec">
        <xsl:variable name="sn">
            <xsl:number select="." level="any"/>
        </xsl:variable>
        <span class="{concat('classsec', count(ancestor::sec))}">
            <xsl:if test="normalize-space(@id)">
                <xsl:attribute name="id" select="@id"/>
            </xsl:if>
            <xsl:apply-templates select="title/node()"/>
        </span>
        <xsl:apply-templates select="node() except title"/>
    </xsl:template>

    <xsl:template match="back/ack">
        <span class="classsec0" id="{concat('sec1-ack-', position())}">
            <xsl:apply-templates select="title/node()"/>
        </span>
        <xsl:apply-templates select="node() except title"/>
    </xsl:template>

    <xsl:template match="back/ref-list">
        <span class="classsec0" id="{concat('sec1-ref-', position())}">
            <xsl:apply-templates select="title/node()"/>
        </span>
        <xsl:apply-templates select="node() except title"/>
    </xsl:template>


    <!--<xsl:template match="body/sec/sec">
        <span class="classsec1" id="{concat('sec2-',count(parent::sec/preceding-sibling::sec) ,'-', position())}">
            <xsl:apply-templates select="title/node()"/>
        </span>
        <xsl:apply-templates select="node() except title"/>
    </xsl:template>

    <xsl:template match="body/sec/sec">
        <span class="classsec1" id="{concat('sec3-',count(parent::sec/preceding-sibling::sec), '-', count(parent::sec/parent::sec/preceding-sibling::sec) ,'-', position())}">
            <xsl:apply-templates select="title/node()"/>
        </span>
        <xsl:apply-templates select="node() except title"/>
    </xsl:template>-->

    <xsl:template match="sec/p[not(table-wrap)] | ack/p">
        <p class="indent">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="p[table-wrap]">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="ref-list/ref">
        <p class="ref">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="ref/label">
        <a id="{parent::ref/@id}" href="{concat('#', parent::ref/@id, '-', .)}">
            <b>
                <xsl:apply-templates/>
                <xsl:text>. </xsl:text>
            </b>
        </a>
    </xsl:template>

    <xsl:template match="fig">
        <div class="page-f" id="{@id}">
            <div class="image">
                <img src="{concat('../images/',graphic/@xlink:href)}" alt="image" class="calibre7"/>
            </div>
            <p class="fig-label">
                <span>
                    <xsl:apply-templates select="label/node()"/>
                </span>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="caption/title/node() | caption/p/node()"/>
            </p>
        </div>
    </xsl:template>

    <xsl:template match="ext-link">
        <a href="{@xlink:href}">
            <xsl:apply-templates/>
            <xsl:text>. </xsl:text>
        </a>
    </xsl:template>

    <xsl:template match="element-citation">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="mixed-citation">
        <span style="background-color:yellow;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template
        match="pub-id[@pub-id-type = 'pmid'][ancestor::mixed-citation or ancestor::element-citation]">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="element-citation/source | mixed-citation/source">
        <i>
            <xsl:apply-templates/>
        </i>
        <xsl:text>. </xsl:text>
    </xsl:template>
    <xsl:template match="article-title[parent::element-citation]">
        <xsl:apply-templates/>
        <xsl:text>. </xsl:text>
    </xsl:template>

    <xsl:template match="fpage[parent::element-citation]">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::node()[self::lpage]">-</xsl:if>
    </xsl:template>

    <xsl:template match="lpage[parent::element-citation]">
        <xsl:apply-templates/>
        <xsl:text>. </xsl:text>
    </xsl:template>

    <xsl:template match="pub-id[@pub-id-type = 'doi'][parent::element-citation]"/>

    <xsl:template match="volume[parent::element-citation]">
        <xsl:apply-templates/>
        <xsl:text>:</xsl:text>
    </xsl:template>

    <xsl:template match="year[parent::element-citation]">
        <xsl:apply-templates/>
        <xsl:text>;</xsl:text>
    </xsl:template>
    <xsl:template match="issue[parent::element-citation] | supplement[parent::element-citation]">
        <xsl:apply-templates/>
        <xsl:text>:</xsl:text>
    </xsl:template>

    <xsl:template match="person-group">
        <xsl:for-each select="name">
            <xsl:apply-templates/>
            <xsl:choose>
                <xsl:when test="position() = last()">. </xsl:when>
                <xsl:when test="position() != last()">, </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template
        match="given-names[ancestor::person-group] | publisher-loc[ancestor::element-citation] | publisher-name[ancestor::element-citation]">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="suffix[ancestor::person-group or ancestor::contrib-group]">
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="surname[ancestor::person-group]">
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="collab[ancestor::element-citation]">
        <xsl:apply-templates/>
        <xsl:text>; </xsl:text>
    </xsl:template>

    <xsl:template match="comment[ancestor::element-citation]">
        <xsl:text> </xsl:text>
        <span style="background-color:yellow">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <xsl:template match="table-wrap">
        <div class="tablebox" id="{@id}">
            <p class="image" style="background-color:yellow;">Where is table image and where to save
                table.xhtml. <img src="../images/1414-431X-bjmbr-1414-431X20155034-t01tn.jpg"
                    alt="{label}"/>
            </p>
            <p class="smalltable">
                <span>
                    <a href="1414-431X-bjmbr-1414-431X20155034-t01.xhtml">See full table</a>
                </span>
                <br/>
                <span>
                    <xsl:value-of select="label"/>
                    <xsl:text>. </xsl:text>
                </span>
                <xsl:apply-templates select="caption/title/node()"/>
                <br/>
            </p>
            <xsl:apply-templates select="node() except (label | caption)"/>
        </div>
    </xsl:template>

    <xsl:template match="table-wrap-foot/fn/p">
        <p class="table-foot-note" style="background-color:yellow;">
            <xsl:if test="parent::fn/@id != ''">
                <xsl:attribute name="id" select="parent::fn/@id"/>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </p>
    </xsl:template>

    <xsl:template match="table-wrap-foot | table-wrap-foot/fn | colgroup | thead | tbody | col">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="table">
        <table>
            <xsl:attribute name="style" select="thead[1]/@style"/>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    <xsl:template match="tr">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="th | td">
        <xsl:element name="{local-name()}">
            <xsl:variable name="i" select="position()"/>
            <xsl:if test="ancestor::table/colgroup/col[$i]/@align">
                <xsl:attribute name="style"
                    select="concat('text-align:', ancestor::table/colgroup/col[$i]/@align, ';')"/>
            </xsl:if>
            <xsl:if test="@align">
                <xsl:attribute name="style" select="concat('text-align:', @align, ';')"/>
            </xsl:if>

            <xsl:apply-templates select="@* except @align"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="hr">
        <hr/>
    </xsl:template>
    <xsl:template match="br">
        <br/>
    </xsl:template>

    <xsl:template match="disp-formula">
        <div style="background-color:yellow;" class="image2"><img src="../images/" alt=""/>Disp
            formula image.</div>
    </xsl:template>




</xsl:stylesheet>
