package com.avatech.edi.codegen.service.model;

import com.avatech.edi.codegen.data.ModelConstant;
import com.avatech.edi.codegen.model.bo.DomainModel;
import com.avatech.edi.codegen.model.bo.project.modelparameter.BaseModelParameter;
import com.avatech.edi.codegen.service.TemplateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * @author Fancy
 * @date 2019/11/22
 */
@Component
public class ProviderModelService extends AbstractModelService {

    private static final Logger logger = LoggerFactory.getLogger(ProviderModelService.class);

    public ProviderModelService() {
        super("provider_pom.ftl");
    }

    @Autowired
    private TemplateService templateService;

    @Override
    public void createSourcesFile(List<DomainModel> domainModels, BaseModelParameter modelParameter) {
        try {
            super.createSourcesFile(domainModels,modelParameter);

            new File(modelParameter.getSourcesBasePath().concat(File.separator).concat("v1")).mkdirs();
            for (DomainModel domainModel:domainModels) {
                HashMap map = new HashMap();
                map.put("domainModel",domainModel);
                map.put("projectName",modelParameter.getProjectNamePrefix());
                templateService.createTmpleFile(map
                        , modelParameter.getSourcesBasePath().concat(File.separator).concat("v1").concat(File.separator).concat(domainModel.getModelName().concat("V1API.java"))
                        ,"provider"
                        ,"api.ftl");
            }

            HashMap map = new HashMap();
            map.put("projectName",modelParameter.getProjectNamePrefix());
            map.put("applicationname","EDI");
            map.put("projectInfo",modelParameter.getProjectStructure());
            map.put("serviceName",modelParameter.getProjectNamePrefix()
                    +"."
                    + modelParameter.getProjectStructure().getServiceName()
                    + ".provider");
            templateService.createTmpleFile(map
                    , modelParameter.getSourcesBasePath().concat(File.separator).concat(modelParameter.getProjectNamePrefix().toUpperCase()).concat("ProviderApplication.java")
                    ,"provider"
                    ,"starter.ftl");
            templateService.createTmpleFile(map
                    , modelParameter.getSourcesBasePath().concat(File.separator).concat("DahuptConsulServiceRegistry.java")
                    ,"provider"
                    ,"consulregistry.ftl");

            String resourceFile = modelParameter.getRootPath()
                    .concat(File.separator)
                    .concat(ModelConstant.MODEL_RESOURCES_BASE_PATH.replace(".",File.separator));

            File file = new File(resourceFile);
            file.mkdir();
            templateService.createTmpleFile(map
                    ,resourceFile.concat(File.separator).concat("application.yml")
                    ,"provider"
                    ,"application_resource.ftl");
            templateService.createTmpleFile(map
                    ,resourceFile.concat(File.separator).concat("logback-spring.xml")
                    ,"provider"
                    ,"resource_log.ftl");

        } catch (IOException e) {
            logger.error("创建资源文件异常:",e);
        }
    }

    @Override
    public void createTestsFile(List<DomainModel> domainModels, BaseModelParameter modelParameter) {
        try {
            super.createTestsFile(domainModels,modelParameter);
        } catch (IOException e) {
            logger.error("创建资源文件异常:",e);
        }
    }
}