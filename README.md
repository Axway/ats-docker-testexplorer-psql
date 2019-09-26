[![GitHub version](https://badge.fury.io/gh/Axway%2Fats-testexplorer.svg)](https://badge.fury.io/gh/Axway%2Fats-testexplorer)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
# ATS in Docker environment
A docker container with deployed ATS Test Explorer, HTTP DB Logger and PostgreSQL database service

**Documentaion** is available at https://axway.github.io/ats-testexplorer/Test-Explorer---Using-the-ATS-Test-Explorer-Docker-Image.html 

**Download** location at https://hub.docker.com/r/axway/ats-testexplorer-psql/

**Configuration details**:
<ul>
  <li>Database details - Use this when configuring the connection to the HTTP DB Logger.</br>The TestExplorer is pre-configured to use those.
    <ul>
      <li><strong>name</strong> - AtsTestDb</li>
      <li><strong>port</strong> - 5432</li>
      <li><strong>user</strong> - AtsUser</li>
      <li><strong>pass</strong> - AtsPassword</li>
    </ul>
  </li>
  <li>Test Explorer link - <strong>http://localhost:8080/TestExplorer</strong></li>
  <li>HTTP Db Logger (logger) link - <strong>http://localhost:8080/HttpDbLogger/service/logger</strong></li>
  <li>HTTP Db Logger (reporter) link - <strong>http://localhost:8080/HttpDbLogger/service/reporter</strong></li>
</ul>



Other **related projects**:
<ul>
  <li>ATS Framework at https://github.com/Axway/ats-framework</li>
  <li>ATS Test Explorer at https://github.com/Axway/ats-testexplorer</li>
  <li>ATS HTTP DB Logger at https://github.com/Axway/ats-httpdblogger</li>
  <li>ATS Distribution at https://github.com/Axway/ats-distrib</li>
</ul>

**Contact** ATS team at: _ats.team_  _@axway.com_

