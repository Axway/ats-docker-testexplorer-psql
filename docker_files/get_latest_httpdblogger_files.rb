#!/usr/bin/env ruby

require 'rexml/document'

include REXML

$ARTIFACT_VERSION = '4.0.5'
$ARTIFACT_TYPE = 'RELEASE'

if $ARTIFACT_TYPE.eql?('RELEASE')

	# download httpdblogger's war file and move it to the tomcat webapps folder
	`wget https://oss.sonatype.org/content/repositories/releases/com/axway/ats/httpdblogger/ats-httpdblogger/#{$ARTIFACT_VERSION}/ats-httpdblogger-#{$ARTIFACT_VERSION}.war`
	`mv ats-httpdblogger-#{$ARTIFACT_VERSION}.war /home/atsuser/apache-tomcat-8.0.47/webapps/ats-httpdblogger-#{$ARTIFACT_VERSION}.war`

elsif $ARTIFACT_TYPE.eql?('SNAPSHOT')

	# get sonatype maven metadata
	`wget https://oss.sonatype.org/content/repositories/snapshots/com/axway/ats/testexplorer/ats-testexplorer/#{$ARTIFACT_VERSION}-#{$ARTIFACT_TYPE}/maven-metadata.xml`

	doc = Document.new(File.new('maven-metadata.xml'))

	# find latest snapshot
	latest_snapshot_postfix = XPath.first(doc, "//versioning/snapshot/timestamp)").text() + '-' + XPath.first(doc, "//versioning/snapshot/buildNumber)").text()

	## download httpdblogger's war file and move it to the tomcat webapps folder
	`wget https://oss.sonatype.org/content/repositories/snapshots/com/axway/ats/httpdblogger/ats-httpdblogger/#{$ARTIFACT_VERSION}-#{$ARTIFACT_TYPE}/ats-httpdblogger-#{$ARTIFACT_VERSION}-#{latest_snapshot_postfix}.war`
	`mv ats-httpdblogger-#{$ARTIFACT_VERSION}-#{latest_snapshot_postfix}.war /home/atsuser/apache-tomcat-8.0.47/webapps/ats-httpdblogger-#{$ARTIFACT_VERSION}.war`

else
	raise "Unsupported artifact type '#{$ARTIFACT_TYPE}'"
end
