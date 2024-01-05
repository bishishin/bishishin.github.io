<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:atom="http://www.w3.org/2005/Atom" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:param name="limitDateTime" as="xs:dateTime" />
    <xsl:template match="/atom:feed">
        <xsl:copy>
            <xsl:copy-of select="atom:title" />
            <xsl:copy-of select="atom:link" />
            <xsl:copy-of select="atom:updated" />
            <xsl:copy-of select="atom:author" />
            <xsl:copy-of select="atom:id" />
            <xsl:copy-of select="atom:entry[position() &lt;= 20]" />
            <xsl:for-each select="atom:entry[position() &gt; 20]">
                <xsl:if test="xs:dateTime(atom:updated) gt $limitDateTime">
                    <xsl:copy-of select="." />
                </xsl:if>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>