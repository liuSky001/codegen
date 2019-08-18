/**
 * PLEASE KEEP THIS INFOMATION
 * CREATE BY AVATECH EDI CODE TOOL
 * AT ${.now?string["yyyy-MM-dd"]}
 */
package ${table.packageName};
<#if table.businessObjectMaps?has_content>
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;
import java.util.Date;
</#if>
public class ${table.tableProperty} implements I${table.tableProperty}{

    private final String OBJECT_CODE = "";

    public ${table.tableProperty}(){
        initial();
    }
<#list table.tableLines as tableLine>

    <#if tableLine.proDesc?has_content>
    /**
     * ${tableLine.proDesc}
     */
   </#if>
    private ${tableLine.proDataType} ${tableLine.proName?uncap_first};

</#list>

<#if table.businessObjectMaps?has_content>
    <#list table.businessObjectMaps as childTable>
    private List<${childTable.childTableProName}> ${childTable.childTableProName?uncap_first}s;

    </#list>
</#if>

<#list table.tableLines as tableLine>
     /**
     * 获取${tableLine.proDesc}
     */
    @Override
    public ${tableLine.proDataType} get${tableLine.proName?cap_first}() {
        return ${tableLine.proName?uncap_first};
    }

    /**
     * 设置${tableLine.proDesc}
     */
    @Override
    public void set${tableLine.proName?cap_first}(${tableLine.proDataType?cap_first} ${tableLine.proName?uncap_first}) {
        this.${tableLine.proName?uncap_first} = ${tableLine.proName?uncap_first};
    }
</#list>
    private String isDelete;

    private String objectCode;

<#if table.businessObjectMaps?has_content>
    <#list table.businessObjectMaps as childTable>

    @Override
    public List<${childTable.childTableProName}> get${childTable.childTableProName?uncap_first}s() {
        if(${childTable.childTableProName?uncap_first}s == null){
            ${childTable.childTableProName?uncap_first}s = new ArrayList<>();
        }
        return ${childTable.childTableProName?uncap_first}s;
    }

    @Override
    public void set${childTable.childTableProName?cap_first}s(List<${childTable.childTableProName?cap_first}> ${childTable.childTableProName?uncap_first}s) {
        this.${childTable.childTableProName?uncap_first}s = ${childTable.childTableProName?uncap_first}s;
    }
    </#list>
</#if>

    @Override
    public String getObjectCode() {
    return objectCode;
    }

    @Override
    public String getIsDelete() {
    return isDelete;
    }

    @Override
    public void setIsDelete(String isDelete) {
    this.isDelete = isDelete;
    }

    @Override
    public void initial() {
    this.objectCode = OBJECT_CODE;
    }

    @Override
    public void check() {

    }
}
