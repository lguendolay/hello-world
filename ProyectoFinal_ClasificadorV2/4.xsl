<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    Materias Angel <br/> <br/>
    <xsl:for-each select="//materia">
        <xsl:if test="grado='Octavo'">
          Código: <xsl:value-of select="@id"/> <br/>
          Nombre: <xsl:value-of select="nombre"/> <br/> <br/>
        </xsl:if>
      </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>