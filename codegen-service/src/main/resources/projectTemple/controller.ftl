/**
 * PLEASE KEEP THIS INFOMATION
 * CREATE BY AVATECH EDI CODE TOOL
 * AT ${.now?string["yyyy-MM-dd"]}
 */
package com.avatech.edi.${businessObject.applicationName}.api;

import ${businessObject.bussinessObjectServicePackageName};
import ${businessObject.bussinessObjectRepositoryPackageName};
import com.avatech.edi.model.dto.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
<#if businessObject.bussinessObjectModelPackageName?has_content>
 <#list businessObject.bussinessObjectModelPackageName as modelName>
import ${modelName};
 </#list>
</#if>
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("v1/*")
@Api(value="${businessObject.bussinessObjectName}",tags={"${businessObject.bussinessObjectName} service"})
public class ${businessObject.bussinessObjectName}Controller {

    private final Logger logger = LoggerFactory.getLogger(${businessObject.bussinessObjectName}Controller.class);

    @Autowired
    private ${businessObject.bussinessObjectName}Service ${businessObject.bussinessObjectName?uncap_first}Service;

    @Autowired
    private ${businessObject.bussinessObjectName}Repository ${businessObject.bussinessObjectName?uncap_first}Repository;


    @GetMapping("${businessObject.bussinessObjectName?lower_case}")
    @ApiOperation(value="查询${businessObject.bussinessObjectName}信息", notes="根据条件查询${businessObject.bussinessObjectName}信息")
    public ${businessObject.bussinessObjectName} fetch${businessObject.bussinessObjectName}(){
        return  null;
    }


    @PostMapping("${businessObject.bussinessObjectName?lower_case}")
    @ApiOperation(value="保存${businessObject.bussinessObjectName}信息", notes="保存${businessObject.bussinessObjectName}信息，并返回")
    public @ResponseBody Result save${businessObject.bussinessObjectName}(@RequestBody ${businessObject.bussinessObjectName} ${businessObject.bussinessObjectName?uncap_first}){
        return null;
    }


}