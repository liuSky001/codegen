server:
  port: 9101

<#if projectInfo.dataBaseType == "MSSQL">
spring:
  datasource:
    url: "jdbc:sqlserver://127.0.0.1;DatabaseName=XXX"
    username: XX
    password: XX
    driver-class-name: com.microsoft.sqlserver.jdbc.SQLServerDriver
</#if>
<#if projectInfo.dataBaseType == "HANADB">
spring:
  datasource:
    url: "jdbc:sap://127.0.0.1:30015?currentschema=XXX"
    username: XX
    password: XX
    driver-class-name: com.sap.db.jdbc.Driver
</#if>
<#if projectInfo.dataBaseType == "MYSQL">
spring:
  datasource:
    url: "jdbc:mysql://127.0.0.1:3306/XXX?useUnicode=true&characterEncoding=utf-8"
    username: XX
    password: XX
    driver-class-name: com.mysql.jdbc.Driver
</#if>
<#if projectInfo.dataBaseType == "POSTGRESQL">
spring:
  datasource:
    url: "jdbc:postgresql://127.0.0.1:5432/XXX"
    username: XX
    password: XX
    driver-class-name: org.postgresql.Driver
</#if>