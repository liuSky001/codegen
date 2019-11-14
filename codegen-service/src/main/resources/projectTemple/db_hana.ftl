/**
 * PLEASE KEEP THIS INFOMATION
 * CREATE BY AVATECH EDI CODE TOOL
 * AT ${.now?string["yyyy-MM-dd"]}
 */
<#if tables?has_content>
    <#list tables as tables>
        CREATE TABLE ${tables.tableName}(
            <#if tables.tableLines?has_content>
                <#list tables.tableLines as tableLines>
                    "${tableLines.fieldName}" ${tableLines.fieldType}(${tableLines.fieldSize}) <#if tableLines?has_next>,</#if>
                </#list>
            </#if>
        );
        CREATE VIEW ${tables.viewName} AS SELECT
        <#if tables.tableLines?has_content>
            <#list tables.tableLines as tableLines>
            "${tableLines.fieldName}" <#if tableLines?has_next>,</#if>
            </#list>
            FROM ${tables.tableName};
        </#if>
    </#list>

</#if>
