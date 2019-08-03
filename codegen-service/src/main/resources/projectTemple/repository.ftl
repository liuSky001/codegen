/**
 * PLEASE KEEP THIS INFOMATION
 * CREATE BY AVATECH EDI CODE TOOL
 * AT ${.now?string["yyyy-MM-dd"]}
 */
package ${mapperObject.packageName};

<#if mapperObject.mapperObjectItems?has_content>
    <#list mapperObject.mapperObjectItems as mapperItem>
import ${mapperItem.boPackageName};
    </#list>
</#if>
import org.springframework.stereotype.Component;
import java.util.List;

public interface ${mapperObject.mapperObjName}Repository{

    void save${mapperObject.mapperObjName}(${mapperObject.mapperObjName} ${mapperObject.mapperObjName?uncap_first});

    List<${mapperObject.mapperObjName}> fetch${mapperObject.mapperObjName}s();

}