<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>
                <div>
                <xsl:call-template name="page">
                    <xsl:with-param name="start" select="4"/>
                    <xsl:with-param name="end" select="10"/>
                    <xsl:with-param name="current" select="7"/>
                </xsl:call-template>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="page">

        <xsl:param name="start"/>
        <xsl:param name="end"/>
        <xsl:param name="current"/>

        <xsl:if test="$start &lt;= $end">
            <xsl:choose>
                <xsl:when test="$start = $current">
                    <strong>
                        <xsl:value-of select="$start"/>
                    </strong>
                </xsl:when>
                <xsl:otherwise>
                    <a href="?p={$start}">
                        <xsl:value-of select="$start"/>
                    </a>
                </xsl:otherwise>
            </xsl:choose>
        <xsl:text> </xsl:text>
        </xsl:if>

        <xsl:if test="$start &lt;= $end">
            <xsl:call-template name="page">
            <xsl:with-param name="start">
                <xsl:value-of select="$start + 1"/>
            </xsl:with-param>
            <xsl:with-param name="end">
                <xsl:value-of select="$end"/>
            </xsl:with-param>
            <xsl:with-param name="current">
                <xsl:value-of select="$current"/>
            </xsl:with-param>
            </xsl:call-template>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>