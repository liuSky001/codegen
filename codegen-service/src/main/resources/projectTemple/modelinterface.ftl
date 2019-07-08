/**
* PLEASE KEEP THIS INFOMATION
* CREATE BY AVATECH EDI CODE TOOL
* AT ${.now?string["yyyy-MM-dd"]}
*/
package ${table.packageName};
<#if table.businessObjectMaps?has_content>
import java.util.ArrayList;
import java.util.List;
</#if>
public class ${table.tableProperty} {

<#list table.tableLines as tableLine>
/**
* 获取${tableLine.proDesc}
*/
public ${tableLine.proDataType} get${tableLine.proName?cap_first}();

/**
* 设置${tableLine.proDesc}
*/
public void set${tableLine.proName?cap_first}(${tableLine.proDataType?cap_first} ${tableLine.proName?uncap_first});

</#list>
<#if table.businessObjectMaps?has_content>
    <#list table.businessObjectMaps as childTable>

    public List<${childTable.childTableProName}> get${childTable.childTableProName?uncap_first}s();

    public void set${childTable.childTableProName?cap_first}s(List<${childTable.childTableProName?cap_first}> ${childTable.childTableProName?uncap_first}s);
    </#list>
</#if>
}