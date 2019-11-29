<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="hoy">
		2005
	</xsl:variable>
	<xsl:template match="//catalogo">
		<html lang="es-ES">
			<head>
				<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
				<title>
					Ingenieria del Conocimiento
				</title>
			</head>
			<body style="font-family : sans-serif;">
				<h1>
					Ingenieria del Conocimiento- "Clasificador"
				</h1>
				<h2>
					Mejores libros informaticos de
					<xsl:value-of select="$hoy - 5">
					</xsl:value-of>
					o posteriores, ordenadas por autor
				</h2>
				<table style="border : 2px solid black; border-collapse : collapse" summary="Listado tabulado de las obras">
					<tr style="color : black; background-color : green;">
						<th style="border : 1px solid green;">
							Autor
						</th>
						<th style="border : 1px solid green;">
							Título
						</th>
					</tr>
					<xsl:for-each select="operaciones/datos/libro[edicion/anyo >= $hoy - 5]">
						<xsl:sort select="autor[1]">
						</xsl:sort>
						<tr>
							<td style="border : 1px solid green;">
								<xsl:value-of select="autor">
								</xsl:value-of>
							</td>
							<td style="border : 1px solid green;">
								<xsl:apply-templates select="titulo" />
								<xsl:if test="edicion[@numedic]">
									(
									<xsl:value-of select="edicion/@numedic" />
									a. ed.)
								</xsl:if>
								<xsl:choose>
									<xsl:when test="edicion/anyo >= $hoy - 1"> (****) </xsl:when>
									<xsl:when test="edicion/anyo >= $hoy - 2"> (***) </xsl:when>
									<xsl:when test="edicion/anyo >= $hoy - 3"> (**) </xsl:when>
									<xsl:when test="edicion/anyo >= $hoy - 4"> (*) </xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<td style="border : 1px solid gray;">
									<xsl:apply-templates select="anyo">
									</xsl:apply-templates>
									<xsl:if test="edicion/anyo = 2005">
										(2005)
									</xsl:if>
								</td>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>
					Nota: Los asteriscos indican obras de los cuatro últimos años (****: año en curso -
					<xsl:value-of select="$hoy"/>
					- y anterior)
				</p>
				<h1>
					Lista de consultas SQL
				</h1>

				<xsl:for-each select="child::*/*">
					<xsl:choose>
						<xsl:when test="name()='disenio'">
							<xsl:for-each select="child::*">
								CREATE TABLE
								<xsl:value-of select="name(.)"/>
								(
								<xsl:for-each select="child::*">
									<xsl:value-of select="name(.)"/>
									<xsl:choose>
										<xsl:when test="(.)='entero'"> int </xsl:when>
										<xsl:when test="(.)='texto'"> text </xsl:when>
										<xsl:when test="(.)='logico'"> boolean </xsl:when>
										<xsl:when test="(.)='decimal'"> double </xsl:when>
										<xsl:when test="(.)='fecha'"> date </xsl:when>
									</xsl:choose>
									<xsl:if test="following-sibling::*">
										,
									</xsl:if>
								</xsl:for-each>
								);
								<br/>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="name()='datos'">
							<xsl:for-each select="child::*">
								INSERT INTO
								<xsl:value-of select="name(.)" />
								VALUES (
								<xsl:for-each select="child::*">
									<xsl:value-of select="(.)" />
									<xsl:if test="following-sibling::*">
										,
									</xsl:if>
								</xsl:for-each>
								);
								<br/>
							</xsl:for-each>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>

			</body>
		</html>
	</xsl:template>
	<xsl:template match="enfasis">
		<span style="font-weight : bold;">
			<xsl:value-of select=".">
			</xsl:value-of>
		</span>
	</xsl:template>
</xsl:stylesheet>
