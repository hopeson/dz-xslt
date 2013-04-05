<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html><body>
            <h2>Выбрать все ноды, "глубина залегания" которых является четным числом
                (для корневого элемента "глубина" равно 0.</h2>
            <xsl:call-template name="even"/>

            <h2>Выбрать все ноды, у которых есть "старший брат" и "младший брат".</h2>
            <xsl:call-template name="big-brother"/>

            <h2>Выбрать все ноды, у "деда" которых ровно 6 потомков.</h2>
            <xsl:call-template name="grandpa"/>

            <h2>Выбрать все ноды, у которых есть предок и потомок с одинаковым классом.</h2>
            <xsl:call-template name="dad-child"/>

            <h2>Вычислить максимальное и минимальное значение среди всех `item`'ов.</h2>
            <xsl:call-template name="max-min"/>

        </body></html>
    </xsl:template>


    <xsl:template name="even">
        <ul><xsl:apply-templates select="//*[position() mod 2 = 0]"/></ul>
    </xsl:template>

    <xsl:template name="big-brother">
        <ul><xsl:apply-templates select="//*[preceding-sibling::item and following-sibling::item]"/></ul>
    </xsl:template>

    <xsl:template name="grandpa">
        <ul><xsl:apply-templates select="//*[count(descendant::*)=6]"/></ul>
    </xsl:template>

    <xsl:template name="dad-child">
        <ul><xsl:apply-templates select="//*[parent::*/@class = child::*/@class]"/></ul>
    </xsl:template>

    <xsl:template name="max-min">
        <ul><xsl:apply-templates select="//item[last()][not (. &lt; //item)]/text()|//item[1][not (. &gt; //item)]/text()"/></ul>
    </xsl:template>

    <xsl:template match="item">
        <li><xsl:value-of select="concat(@id, '  ', text())"/></li>
    </xsl:template>



</xsl:stylesheet>