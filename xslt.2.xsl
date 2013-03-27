<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="b">
        <strong>
            <xsl:apply-templates select="@*|node()"/>
        </strong>
    </xsl:template>

    <xsl:template match="i">
        <em>
            <xsl:apply-templates select="@*|node()"/>
        </em>
    </xsl:template>


    <xsl:template match="//div[@class = 'code']">
        <pre>
            <xsl:apply-templates select="@*|node()"/>
        </pre>
    </xsl:template>

    <xsl:template match="//div[@class = 'head']">
        <h1>
            <xsl:apply-templates select="@*|node()"/>
        </h1>
    </xsl:template>


    <xsl:template match="//@class|//@style"/>


    <xsl:template match="//div[@class = 'code']//@*|//div[@class = 'code']//node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>