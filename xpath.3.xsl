<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html><body>
            <h2>Выбрать `item`'ы, у которых `value` совпадает
                с порядковым номером в списке, умноженным на 10.</h2>
            <xsl:call-template name="val-num"/>

            <h2>Выбрать `item`'ы, у которых `value` больше, чем у
                следующего за ним `item`'а.</h2>
            <xsl:call-template name="val-compare"/>

            <h2>Выбрать все "хорошие" ноды.</h2>
            <xsl:call-template name="good"/>

            <h2>Выбрать ноды, являющиеся и "хорошими", и "плохими".</h2>
            <!--<xsl:call-template name="equal"/>-->

            <h2>Выбрать все ноды, не связанные с "плохими" нодами.</h2>
            <xsl:call-template name="not-bad"/>

        </body></html>
    </xsl:template>


    <xsl:template name="val-num">
        <ul><xsl:apply-templates select="//item[position()*10 = number(child::value)]"/></ul>
    </xsl:template>

    <xsl:template name="val-compare">
        <ul><xsl:apply-templates select="//item[child::value/text() &lt; following-sibling::item/child::value/text()]"/></ul>
    </xsl:template>

    <xsl:template name="good">
        <ul><xsl:apply-templates select="//*[position() = number(substring(//good, 1, 1)) or position() = number(substring(//good, 3, 1)) or position() = number(substring(//good, 5, 1))]"/></ul>
    </xsl:template>

    <!--<xsl:template name="equal">-->
        <!--<ul>-->
            <!--<xsl:apply-templates select="//*[contains(//good, substring(//bad, 1, 1)) or contains(//good, substring(//bad, 3, 1)) or contains(//good, substring(//bad, 5, 1))]"/>-->
        <!--</ul>-->
    <!--</xsl:template>-->

    <xsl:template name="not-bad">
        <ul><xsl:apply-templates select="//*[position() != number(substring(//bad, 1, 1)) and position() != number(substring(//bad, 3, 1))  and position() != number(substring(//bad, 5, 1))]"/></ul>
    </xsl:template>


    <xsl:template match="//*">
        <li><xsl:value-of select="concat(name(),' ', @id, ' ', text())"/></li>
    </xsl:template>

</xsl:stylesheet>