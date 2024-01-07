<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:atom="http://www.w3.org/2005/Atom">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/atom:feed/atom:entry/atom:link/@href">
        <xsl:attribute name="href">
            <xsl:value-of select="substring-before(., '?')" />
        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>