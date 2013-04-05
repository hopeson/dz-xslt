<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html><body>
        <h2>Выбрать людей, у которых есть телефон.</h2>
            <xsl:call-template name="phone"/>

        <h2>Выбрать людей, у которых есть мобильный телефон.</h2>
            <xsl:call-template name="phone-mob"/>

        <h2>Выбрать людей, у которых есть и рабочий, и мобильный телефон.</h2>
            <xsl:call-template name="phone-mob-work"/>

        <h2>Выбрать людей, у которых email начинается с `login@`</h2>
            <xsl:call-template name="email-login"/>

        <h2>Выбрать людей, принадлежащих к группе html</h2>
            <xsl:call-template name="group-html"/>

        <h2>Выбрать людей, у которых "длинный" логин (длиннее трех символов)</h2>
            <xsl:call-template name="login-length"/>

        <h2>Выбрать для каждого человека по одному его контакту -
            мобильный телефон, рабочий телефон или email (что-нибудь одно, все равно что).</h2>
            <xsl:call-template name="choose-contact"/>

        <h2>Выбрать для каждого контакта его рабочий телефон, если нет рабочего, то мобильный,
            если нет никакого телефона, то email.</h2>
            <xsl:call-template name="choose-contact-filter"/>

        </body></html>
    </xsl:template>


    <xsl:template name="phone">
        <ul><xsl:apply-templates select="//phone/preceding-sibling::login"/></ul>
    </xsl:template>

    <xsl:template name="phone-mob">
        <ul><xsl:apply-templates select="/persons/person/phone[@type = 'mobile']/preceding-sibling::login"/></ul>
    </xsl:template>

    <xsl:template name="phone-mob-work">
        <ul><xsl:apply-templates select="/persons/person[child::phone[@type = 'work'] and child::phone[@type = 'mobile']]/login"/></ul>
    </xsl:template>

    <xsl:template name="email-login">
        <ul><xsl:apply-templates select="/persons/person/email[starts-with(., preceding-sibling::login[text()])]/preceding-sibling::login"/></ul>
    </xsl:template>

    <xsl:template name="group-html">
        <ul><xsl:apply-templates select="/persons/person/group[text() = 'html']/preceding-sibling::login"/></ul>
    </xsl:template>

    <xsl:template name="login-length">
        <ul><xsl:apply-templates select="/persons/person/login[string-length(normalize-space(.)) &gt; 3]"/></ul>
    </xsl:template>

    <xsl:template name="choose-contact">
        <ul><xsl:apply-templates select="(/persons/person/login|/persons/person/*[self::email or self::phone[@type = 'work'] or self::phone[@type = 'mobile']][1])"/></ul>
    </xsl:template>

    <xsl:template name="choose-contact-filter">
        <ul><xsl:apply-templates select="(/persons/person/login|/persons/person/*[self::email or self::phone[@type = 'work'] or self::phone[@type = 'mobile']][last()])"/></ul>
    </xsl:template>

    <xsl:template match="/persons/person/login">
        <li><xsl:value-of select="text()"/></li>
    </xsl:template>


</xsl:stylesheet>