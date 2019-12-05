<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <xsl:for-each select="//materia">
      <xsl:if test="secuencia/@sec=4NM81 or secuencia/@sec=4NM80">
        Código: <xsl:value-of select="@id"/>
        Grado: <xsl:value-of select="grado"/>
        Nombre: <xsl:value-of select="nombre"/>
        Secuencia: <xsl:value-of select="secuencia/@sec"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
