<xsl:transform version="1.0"
               xmlns:hr="http://www.hr-xml.org/3"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:oa="http://www.openapplications.org/oagis/9"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               exclude-result-prefixes="hr oa xsi">
    <xsl:import href="Var.xsl"/>
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
                    <ExternalCustomerId>
                        <xsl:value-of select="normalize-space(./hr:DocumentID)"/>
                    </ExternalCustomerId>
                    <ExternalId>
                        <xsl:value-of select="normalize-space(./hr:AlternateDocumentID)"/>
                    </ExternalId>
                    <StatusId>
                        <xsl:choose>
                            <xsl:when test="normalize-space(./hr:PositionOpeningStatusCode)='Active'">
                                1
                            </xsl:when>
                            <xsl:otherwise>
                                0
                            </xsl:otherwise>
                        </xsl:choose>
                    </StatusId>
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
