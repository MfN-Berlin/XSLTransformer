<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2015sp2

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:agt="http://www.altova.com/Mapforce/agt" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="agt xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template name="agt:MapTosolrinput_var2_create_field">
		<xsl:param name="var1_current"/>
		<field>
			<xsl:attribute name="name">
				<xsl:value-of select="string($var1_current/@contrib-type)"/>
			</xsl:attribute>
			<xsl:value-of select="string($var1_current/string-name)"/>
		</field>
	</xsl:template>
	<xsl:template name="agt:MapTosolrinput_var4_create_field">
		<xsl:param name="var3_current"/>
		<field>
			<xsl:attribute name="name">reference</xsl:attribute>
			<xsl:value-of select="normalize-space(string($var3_current/mixed-citation))"/>
		</field>
	</xsl:template>
	<xsl:template name="agt:MapTosolrinput_var6_create_doc">
		<xsl:param name="var5_current"/>
		<doc>
			<field>
				<xsl:attribute name="name">article-title</xsl:attribute>
				<xsl:value-of select="string($var5_current/front/article-meta/title-group/article-title)"/>
			</field>
			<xsl:for-each select="$var5_current/front/article-meta/contrib-group/contrib">
				<xsl:call-template name="agt:MapTosolrinput_var2_create_field">
					<xsl:with-param name="var1_current" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$var5_current/back/ref-list/ref">
				<xsl:call-template name="agt:MapTosolrinput_var4_create_field">
					<xsl:with-param name="var3_current" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<field>
				<xsl:attribute name="name">abstract</xsl:attribute>
				<xsl:value-of select="normalize-space(string($var5_current/front/article-meta/abstract/p))"/>
			</field>
		</doc>
	</xsl:template>
	<xsl:template match="/">
		<add>
			
			<xsl:for-each select="article">
				<xsl:call-template name="agt:MapTosolrinput_var6_create_doc">
					<xsl:with-param name="var5_current" select="."/>
				</xsl:call-template>
			</xsl:for-each>
		</add>
	</xsl:template>
</xsl:stylesheet>