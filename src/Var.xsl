<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="loweCase" select="'abcdefghijklmnopqrstuvwxyzöäü'"/>
    <xsl:variable name="upperCase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÖÄÜ'"/>
    <xsl:variable name="allowedLanguages">
        <language>de</language>
        <language>en</language>
        <language>fr</language>
        <language>hr</language>
    </xsl:variable>
</xsl:stylesheet>
