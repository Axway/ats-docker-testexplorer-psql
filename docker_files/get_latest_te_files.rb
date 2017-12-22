#!/usr/bin/env ruby

require 'rexml/document'

include REXML

$TESTEXPLORER_VERSION = '4.0.3'
$ARTIFACT_TYPE = 'RELEASE'

if $ARTIFACT_TYPE.eql?('RELEASE')

	# download testexplorer's war file and move it to the tomcat webapps folder
	`wget https://oss.sonatype.org/content/repositories/releases/com/axway/ats/testexplorer/ats-testexplorer/#{$TESTEXPLORER_VERSION}/ats-testexplorer-#{$TESTEXPLORER_VERSION}.war`
	`mv ats-testexplorer-#{$TESTEXPLORER_VERSION}.war /home/atsuser/apache-tomcat-8.0.47/webapps/ats-testexplorer-#{$TESTEXPLORER_VERSION}.war`

	# get testexplorer's zip archive
	`wget https://oss.sonatype.org/content/repositories/releases/com/axway/ats/testexplorer/ats-testexplorer/#{$TESTEXPLORER_VERSION}/ats-testexplorer-#{$TESTEXPLORER_VERSION}.zip`

elsif $ARTIFACT_TYPE.eql?('SNAPSHOT')

	# get sonatype maven metadata
	`wget https://oss.sonatype.org/content/repositories/snapshots/com/axway/ats/testexplorer/ats-testexplorer/#{$TESTEXPLORER_VERSION}-SNAPSHOT/maven-metadata.xml`

	doc = Document.new(File.new('maven-metadata.xml'))

	# find latest snapshot
	latest_snapshot_postfix = XPath.first(doc, "//versioning/snapshot/timestamp").text() + '-' + XPath.first(doc, "//versioning/snapshot/buildNumber").text()

	# download testexplorer's war file and move it to the tomcat webapps folder
	`wget https://oss.sonatype.org/content/repositories/snapshots/com/axway/ats/testexplorer/ats-testexplorer/#{$TESTEXPLORER_VERSION}-SNAPSHOT/ats-testexplorer-#{$TESTEXPLORER_VERSION}-#{latest_snapshot_postfix}.war`
	`mv ats-testexplorer-#{$TESTEXPLORER_VERSION}-#{latest_snapshot_postfix}.war /home/atsuser/apache-tomcat-8.0.47/webapps/ats-testexplorer-#{$TESTEXPLORER_VERSION}-SNAPSHOT.war`

	# get testexplorer's zip archive
	`wget https://oss.sonatype.org/content/repositories/snapshots/com/axway/ats/testexplorer/ats-testexplorer/#{$TESTEXPLORER_VERSION}-SNAPSHOT/ats-testexplorer-#{$TESTEXPLORER_VERSION}-#{latest_snapshot_postfix}.zip`

else
	raise "Unsupported artifact type '#{$ARTIFACT_TYPE}'"
end
