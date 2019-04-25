<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="xs fo" version="2.0">

	<xsl:variable name="image" select="'C:\Working\ARGO CONSTRUCTION\18-04-2019\Argo_Con.jpg'"/>

	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="sample">
					<fo:region-body margin-top=".5in" margin-bottom=".5in" margin-right=".8in" margin-left=".8in"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="sample">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:table>
							<fo:table-column column-number="1" column-width="180pt"/>
							<fo:table-column column-number="2" column-width="300pt"/>
							<fo:table-body start-indent="0pt" end-indent="0pt">
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" text-align="left">
											<fo:inline font-weight="bold" font-size="12pt">
												<xsl:value-of select="/root/personal/name"/>
											</fo:inline>
										</fo:block>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="/root/personal/address/curren/concat(string-join((addr1,addr2,landmark,city), ', '), ' ', pin)"/>
											</fo:inline>
										</fo:block>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="3pt" text-align="left">
											<fo:inline>Mob:</fo:inline>
											<fo:leader/>
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/personal/communication/contact_number"/>
											</fo:inline>
										</fo:block>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="3pt" text-align="left">
											<fo:inline>Email:</fo:inline>
											<fo:leader/>
											<fo:basic-link external-destination="{concat('url(mailto:',root/personal/communication/email,')')}">
												<fo:inline color="#551A8B">
													<xsl:value-of select="root/personal/communication/email"/>
												</fo:inline>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" text-align="right">
											<fo:inline font-weight="bold" font-size="10pt">
												<fo:external-graphic padding-top="0pt" padding-left="0pt" content-width="120pt" content-height="60pt" src="url({$image})"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-left="0pt">
									<fo:table-cell border-bottom-style="solid" border-bottom-width="2pt">
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" text-align="center">
											<fo:inline font-weight="bold" font-size="10pt">
												<fo:leader line-height="5pt"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-bottom-style="solid" border-bottom-width="2pt">
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" text-align="center">
											<fo:inline font-weight="bold" font-size="10pt">
												<fo:leader line-height="5pt"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						<fo:block>
							<fo:leader line-height="1pt"/>
						</fo:block>

						<!-- Summary section: -->
						<xsl:if test="normalize-space(/root/profile_summary)">
							<fo:block start-indent="-3.6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt">
								<fo:inline font-size="12pt" font-weight="bold">
									<xsl:value-of select="'Summary:'"/>
								</fo:inline>
							</fo:block>
							<fo:block start-indent="6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt" text-align="justify">
								<fo:inline font-size="10pt">
									<xsl:value-of select="/root/profile_summary"/>
								</fo:inline>
							</fo:block>
						</xsl:if>
						<!-- Objectives section: -->
						<xsl:if test="normalize-space(/root/profile_summary)">
							<fo:block start-indent="-3.6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt">
								<fo:inline font-size="12pt" font-weight="bold">
									<xsl:value-of select="'Objectives:'"/>
								</fo:inline>
							</fo:block>
							<fo:block start-indent="6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt" text-align="justify">
								<fo:inline font-size="10pt">
									<xsl:value-of select="/root/career_objective"/>
								</fo:inline>
							</fo:block>
						</xsl:if>

						<fo:block start-indent="-3.6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt">
							<fo:inline font-size="12pt" font-weight="bold">Experiences:</fo:inline>
						</fo:block>

						<xsl:for-each select="/root/experiance/organization">
						<xsl:sort select="@id" order="descending"/>
							<fo:table start-indent="-3.6pt">
								<fo:table-column column-number="1" column-width="144pt"/>
								<fo:table-column column-number="2" column-width="306pt"/>
								<fo:table-body start-indent="0pt" end-indent="0pt">
									<fo:table-row padding-top="0pt" padding-bottom="0pt">
										<fo:table-cell>
										<fo:block><fo:leader/></fo:block>
											<fo:block font-family="TimesNewRoman" font-size="12pt" language="EN-US" space-after="6pt" font-weight="bold">
												<fo:inline font-weight="bold">
													<xsl:value-of select="concat(DOJ, ' to ' ,DOL)"/>
												</fo:inline>
											</fo:block>
											<fo:table start-indent="65pt">
												<fo:table-column column-number="1" column-width="60pt"/>
												<fo:table-column column-number="2" column-width="450pt"/>
												<fo:table-body start-indent="0pt" end-indent="0pt">
													<fo:table-row padding-top="0pt" padding-bottom="0pt">
														<fo:table-cell>
															<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" space-after="6pt" text-align="left">
																<fo:inline font-weight="bold" font-size="10pt">Company:</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell>
															<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" space-after="6pt" text-align="left">
																<fo:inline font-size="10pt">
																	<xsl:value-of select="organization_name"/>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row padding-top="0pt" padding-bottom="0pt">
														<fo:table-cell>
															<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" space-after="6pt" text-align="left">
																<fo:inline font-weight="bold" font-size="10pt">Position:</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell>
															<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" space-after="6pt" text-align="left">
																<fo:inline font-size="10pt">
																	<xsl:value-of select="designation"/>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
												</fo:table-body>
											</fo:table>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row padding-top="0pt" padding-bottom="0pt">
										<fo:table-cell number-columns-spanned="2">
											<fo:block></fo:block>
											<fo:block font-family="TimesNewRoman" font-size="12pt" language="EN-US" space-before="6pt" font-weight="bold" text-align="justify">
												<fo:inline font-weight="bold">Company Profile:</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row padding-top="0pt" padding-bottom="0pt">
										<fo:table-cell number-columns-spanned="2">
											<fo:block></fo:block>
											<fo:block font-family="TimesNewRoman" font-size="10pt" space-before="6pt" language="EN-US" start-indent="9pt" text-align="justify">
												<fo:inline font-size="12pt">
													<xsl:value-of select="company_profile"/>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row padding-top="0pt" padding-bottom="0pt">
										<fo:table-cell number-columns-spanned="2">
											<fo:block></fo:block>
											<fo:block font-family="TimesNewRoman" font-size="12pt" language="EN-US" space-before="6pt">
												<fo:inline font-weight="bold">Project Profile:</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row padding-top="0pt" padding-bottom="0pt">
										<fo:table-cell>
											<fo:block></fo:block>
											<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt" text-align="left">
												<fo:table start-indent="65pt">
													<fo:table-column column-number="1" column-width="60pt"/>
													<fo:table-column column-number="2" column-width="350pt"/>
													<fo:table-body start-indent="0pt" end-indent="0pt">
														<fo:table-row padding-top="0pt" padding-bottom="0pt">
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-weight="bold" font-size="10pt">Name:</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-size="10pt">
																		<xsl:value-of select="Project_details/project_name"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row padding-top="0pt" padding-bottom="0pt">
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-weight="bold" font-size="10pt">Client:</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-size="10pt">
																		<xsl:value-of select="Project_details/client_name"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row padding-top="0pt" padding-bottom="0pt">
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-weight="bold" font-size="10pt">Tools:</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-size="10pt">
																		<xsl:value-of select="Project_details/tools_using"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row padding-top="0pt" padding-bottom="0pt">
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-weight="bold" font-size="10pt">Role:</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-size="10pt">
																		<xsl:value-of select="designation"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row padding-top="0pt" padding-bottom="0pt">
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-weight="bold" font-size="10pt">Team Size:</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell>
																<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="4pt" text-align="left">
																	<fo:inline font-size="10pt">
																		<xsl:value-of select="Project_details/team_size"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block></fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row padding-top="0pt" padding-bottom="0pt">
										<fo:table-cell>
											<fo:block></fo:block>
											<fo:block font-family="TimesNewRoman" font-size="12pt" language="EN-US" space-before="6pt" space-after="6pt">
												<fo:inline font-weight="bold">Description:</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt">
												<fo:leader/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row padding-top="0pt" padding-bottom="0pt">
										<fo:table-cell number-columns-spanned="2">
											<xsl:for-each select="project_description/para">
												<xsl:if test="normalize-space(.)">
													<fo:block font-family="TimesNewRoman" text-align="justify" font-size="10pt" space-before="2pt" language="EN-US" start-indent="9pt">
														<fo:inline font-size="10pt">
															<xsl:value-of select="."/>
														</fo:inline>
													</fo:block>
												</xsl:if>
											</xsl:for-each>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row padding-top="0pt" padding-bottom="0pt">
										<fo:table-cell number-columns-spanned="2">
											<fo:block></fo:block>
											<fo:block font-family="TimesNewRoman" font-size="12pt" language="EN-US" space-before="6pt" space-after="4pt">
												<fo:inline font-weight="bold">Roles and Responsibilities:</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each select="responsibility/res">
										<xsl:if test="normalize-space(.)">
											<fo:table-row padding-top="0pt" padding-bottom="0pt">
												<fo:table-cell number-columns-spanned="2">
													<fo:list-block>
														<fo:list-item font-family="TimesNewRoman" font-size="10pt" language="" space-after="1pt" line-height="1.3190500000000003" start-indent="45pt" end-indent="-10pt">
															<fo:list-item-label font-size="10pt" start-indent="8pt" text-indent="0pt">
																<fo:block>
																	<fo:inline font-family="Arial">●</fo:inline>
																</fo:block>
															</fo:list-item-label>
															<fo:list-item-body end-indent="inherit" start-indent="20pt" text-indent="0pt">
																<fo:block>
																	<fo:inline font-family="TimesNewRoman">
																		<xsl:value-of select="."/>
																	</fo:inline>
																</fo:block>
															</fo:list-item-body>
														</fo:list-item>
													</fo:list-block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</xsl:for-each>
					
						<fo:block start-indent="-3.6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt">
							<fo:inline font-size="12pt" font-weight="bold">Educational Qualification</fo:inline>
						</fo:block>
						
						<fo:block start-indent="-3.6pt" font-family="TimesNewRoman" language="EN-US" space-before="6pt">
						<xsl:for-each select="root/educational/*">
							<xsl:if test="normalize-space(.)">
								<fo:list-block>
									<fo:list-item font-family="TimesNewRoman" font-size="10pt" language="" space-after="1pt" line-height="1.3190500000000003" start-indent="45pt" end-indent="-10pt">
										<fo:list-item-label font-size="10pt" start-indent="5pt" text-indent="0pt">
											<fo:block>
												<fo:inline font-family="Arial">●</fo:inline>
											</fo:block>
										</fo:list-item-label>
										<fo:list-item-body end-indent="inherit" start-indent="20pt" text-indent="0pt">
											<fo:block>
												<fo:inline font-family="TimesNewRoman">
													<xsl:value-of select="."/>
												</fo:inline>
											</fo:block>
										</fo:list-item-body>
									</fo:list-item>
								</fo:list-block>
							</xsl:if>
						</xsl:for-each><fo:inline/>
						</fo:block>


						<fo:block start-indent="-3.6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt" space-after="6pt">
							<fo:inline font-size="12pt" font-weight="bold">Technical Skills:</fo:inline>
						</fo:block>

						<fo:table start-indent="65pt">
							<fo:table-column column-number="1" column-width="100pt"/>
							<fo:table-column column-number="2" column-width="350pt"/>
							<fo:table-body start-indent="0pt" end-indent="0pt">
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt"></fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt"></fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">Operating System:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/technicalskills/operating_system"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">Application Software:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/technicalskills/application_software"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">Programming skills:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/technicalskills/programmingskills"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>

						<fo:block start-indent="-3.6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt">
							<fo:inline font-size="12pt" font-weight="bold">Self Assessment:</fo:inline>
						</fo:block>

						<fo:block start-indent="5pt" text-align="justify" font-family="TimesNewRoman" language="EN-US" space-after="6pt">
							<fo:inline font-size="10pt"><xsl:value-of select="root/self_assessment"/></fo:inline>
						</fo:block>
					
						<fo:block start-indent="-3.6pt" font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="6pt" space-after="6pt">
							<fo:inline font-size="12pt" font-weight="bold">Personal Details:</fo:inline>
						</fo:block>

						<fo:table start-indent="65pt">
							<fo:table-column column-number="1" column-width="100pt"/>
							<fo:table-column column-number="2" column-width="350pt"/>
							<fo:table-body start-indent="0pt" end-indent="0pt">
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt"></fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt"></fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">Name:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/personal/name"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">DOB:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/personal/DOB"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">Gender:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/personal/gender"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">Marital Status:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/personal/marital_status"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">Languages Known:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/personal/language"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-weight="bold" font-size="10pt">Permanent Address:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-after="3pt" space-before="6pt" text-align="left">
											<fo:inline font-size="10pt">
												<xsl:value-of select="root/personal/address/permanent/concat(string-join((addr1,dist,state), ', '), ' ', pin)"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>

					<fo:block><fo:leader leader-height="25pt"/></fo:block>
						<fo:table space-before="30pt">
							<fo:table-column column-number="1" column-width="180pt"/>
							<fo:table-column column-number="2" column-width="300pt"/>
							<fo:table-body start-indent="0pt" end-indent="0pt">
								<fo:table-row padding-top="0pt" padding-bottom="0pt">
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" text-align="center">
											<fo:inline font-size="10pt">
												<xsl:value-of select="format-dateTime(current-dateTime(), '[M01]/[D01]/[Y0001]')"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-family="TimesNewRoman" font-size="10pt" language="EN-US" space-before="4pt" text-align="center">
											<fo:inline font-size="10pt">(<xsl:value-of select="/root/personal/name"/>)</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="CV.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline=""
		          additionalpath="" additionalclasspath="" postprocessortype="custom" postprocesscommandline='"C:\Fop\fop-0.95\fop.bat" -x -c "c:\Fop\fop-0.95\conf\fop.xconf" %1 %2' postprocessadditionalpath="" postprocessgeneratedext="."
		          validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->