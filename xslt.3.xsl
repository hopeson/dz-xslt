<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="menu">
          <xsl:apply-templates select="item"/>
    </xsl:template>

    <xsl:template match="menu/item">
        <li>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="self::*[@name = //page/@name]">item current</xsl:when>
                    <xsl:otherwise>item</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="self::*[@name = 'index']">
                    <a href="/">Главная</a>
                </xsl:when>
                <xsl:when test="self::*[@name = 'catalog']">
                    <a href="/">Каталог</a>
                </xsl:when>
                <xsl:when test="self::*[@name = 'about']">
                    <a href="/about/">О проекте</a>
                </xsl:when>
                <xsl:otherwise>
                    <a href="/help/">Помощь</a>
                </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>

    <xsl:template match="menu">
        <ul>
            <xsl:attribute name="class">b-menu</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </ul>
        <xsl:call-template name="content"/>
    </xsl:template>


    <xsl:template name="content" match="//content">
        <div>
            <xsl:attribute name="class">b-page</xsl:attribute>
            <xsl:call-template name="articles"/>
        </div>
    </xsl:template>

    <xsl:template name="articles" match="//list">
        <div>
            <xsl:attribute name="class">b-section</xsl:attribute>
            <xsl:copy-of select="//list/item/*"/>
        </div>
    </xsl:template>

    <xsl:template match="//links">
        <div>
            <xsl:attribute name="class">b-navigation</xsl:attribute>
            <xsl:call-template name="links"/>
        </div>
    </xsl:template>

    <xsl:template name="links">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="//link[@name = //page/@name]/preceding-sibling::*[1]/@href"/>
            </xsl:attribute>
            Предыдущая
        </a>
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="//link[@name = //page/@name]/following-sibling::*[1]/@href"/>
            </xsl:attribute>
            Следующая
        </a>
    </xsl:template>

    <xsl:template match="/">
        <html>
            <body>
                <xsl:apply-templates select="//menu|//links"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>