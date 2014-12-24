<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output indent="yes" encoding="UTF-8" method="xml"
		omit-xml-declaration="no" />

	<xsl:param name="COMPANY" />
	<xsl:param name="USER" />
	<xsl:param name="PASSWORD" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="tomcat-users">
		<tomcat-users>
			<xsl:apply-templates />
			<user roles="user">
				<xsl:attribute name="username">
					<xsl:value-of select="$COMPANY" />
					<xsl:text>@</xsl:text>
					<xsl:value-of select="$USER" />
				</xsl:attribute>
				<xsl:attribute name="password">
					<xsl:value-of select="$PASSWORD" />
				</xsl:attribute>
			</user>
		</tomcat-users>
	</xsl:template>

	<xsl:template match="role">
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match="user">
		<xsl:copy-of select="." />
	</xsl:template>

</xsl:stylesheet>