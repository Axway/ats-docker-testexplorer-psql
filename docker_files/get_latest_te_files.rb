#!/usr/bin/env ruby

require 'rexml/document'

include REXML

# get sonatype maven metadata
`wget https://oss.sonatype.org/content/repositories/snapshots/com/axway/ats/testexplorer/ats-testexplorer/4.0.2-SNAPSHOT/maven-metadata.xml`

doc = Document.new(File.new('maven-metadata.xml'))

# find latest snapshot
latest_snapshot_postfix = XPath.first(doc, "//versioning/snapshot/timestamp)").text() + '-' + XPath.first(doc, "//versioning/snapshot/buildNumber)").text()

# download testexplorer's war file and move it to the tomcat webapps folder
`wget https://oss.sonatype.org/content/repositories/snapshots/com/axway/ats/testexplorer/ats-testexplorer/4.0.2-SNAPSHOT/ats-testexplorer-4.0.2-#{latest_snapshot_postfix}.war`
`mv ats-testexplorer-4.0.2-#{latest_snapshot_postfix}.war /home/atsuser/apache-tomcat-8.0.47/webapps/ats-testexplorer-4.0.2-SNAPSHOT.war`

# get testexplorer's zip archive
`wget https://oss.sonatype.org/content/repositories/snapshots/com/axway/ats/testexplorer/ats-testexplorer/4.0.2-SNAPSHOT/ats-testexplorer-4.0.2-#{latest_snapshot_postfix}.zip`
