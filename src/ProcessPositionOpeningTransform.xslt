<xsl:transform version="1.0"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xmlns:oa="http://www.openapplications.org/oagis/9"
               xmlns:hr="http://www.hr-xml.org/3"
               exclude-result-prefixes="hr oa xsi xsl">
    <xsl:import href="Vars.xslt"/>
    <xsl:template match="/">
        <ProcessPositionOpening>
            <BusinessObjectDocumentId>
                <xsl:value-of select="normalize-space(//oa:ApplicationArea/oa:BODID)"/>
            </BusinessObjectDocumentId>
            <CreationDateTime>
                <xsl:value-of select="normalize-space(//oa:ApplicationArea/oa:CreationDateTime)"/>
            </CreationDateTime>
            <Vacancy>
                <xsl:for-each select="//hr:ProcessPositionOpening/hr:DataArea/hr:PositionOpening">
                    <setExternalCustomerKey>
                        <xsl:value-of select="normalize-space(./hr:DocumentID)"/>
                    </setExternalCustomerKey>
                    <setCustomerKey>
                        <xsl:value-of select="normalize-space(./hr:AlternateDocumentID)"/>
                    </setCustomerKey>
                    <setStatusId>
                        <xsl:choose>
                            <xsl:when test="contains($trueValues,translate(normalize-space(./hr:PositionOpeningStatusCode),$upperCase,$lowerCase))">
                                <xsl:value-of select="1"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="0"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </setStatusId>
                    <Jobad>
                        <xsl:for-each select="./hr:PositionProfile">
                            <ExternalId>
                                <xsl:value-of select="normalize-space(./hr:ID)"/>
                            </ExternalId>
                            <ExternalCustomerId>
                                <xsl:value-of select="normalize-space(./hr:PositionID)"/>
                            </ExternalCustomerId>
                            <Title>
                                <xsl:value-of select="normalize-space(./hr:PositionTitle)"/>
                            </Title>
                        </xsl:for-each>
                    </Jobad>
                </xsl:for-each>
            </Vacancy>
        </ProcessPositionOpening>
    </xsl:template>
</xsl:transform>
