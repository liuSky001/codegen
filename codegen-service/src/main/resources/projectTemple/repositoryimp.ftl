/**
 * PLEASE KEEP THIS INFOMATION
 * CREATE BY AVATECH EDI CODE TOOL
 * AT ${.now?string["yyyy-MM-dd"]}
 */
package ${mapperObject.packageName}.imp;

<#if mapperObject.mapperObjectItems?has_content>
    <#list mapperObject.mapperObjectItems as mapperItem>
import ${mapperItem.boPackageName};
    </#list>
</#if>
import com.avatech.edi.${mapperObject.mapperApplicationName}.mapper.${mapperObject.mapperObjName}Mapper;
import ${mapperObject.packageName}.${mapperObject.mapperObjName}Repository;
import com.avatech.edi.model.dto.TranscationResult;
import com.avatech.edi.${mapperObject.mapperApplicationName}.mapper.TranscationNoticeMapper;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.ArrayList;
import java.util.List;

@Component
public class ${mapperObject.mapperObjName}RepositoryImp extends BaseBORepositoryService<${mapperObject.mapperObjName}> implements ${mapperObject.mapperObjName}Repository{
<#if mapperObject.mapperObjectItems?has_content>

    private final Logger logger = LoggerFactory.getLogger(${mapperObject.mapperObjName}RepositoryImp.class);

    @Autowired
    private ${mapperObject.mapperObjName}Mapper ${mapperObject.mapperObjName?uncap_first}Mapper;

    @Autowired
    private TranscationNoticeMapper transcationNoticeMapper;

    @Autowired
    private PlatformTransactionManager ptm;

    @Override
    public void save${mapperObject.mapperObjName}(${mapperObject.mapperObjName} ${mapperObject.mapperObjName?uncap_first}){
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = null;
        try {
            status = ptm.getTransaction(def);
            super.saveBO(${mapperObject.mapperObjName?uncap_first});
            ptm.commit(status);
        }catch (BusinessException ex){
            ptm.rollback(status);
            logger.error("保存异常",ex);
            throw ex;
        }catch (BusinessObjectException ex){
            ptm.rollback(status);
            logger.error("保存异常",ex);
            throw ex;
        }catch (Exception e) {
            if(status != null){
                ptm.rollback(status);
            }
            logger.error("保存异常",e);
            throw new DBException("保存异常",e.getMessage());
        }
    }
    @Override
    public List<${mapperObject.mapperObjName}> fetch${mapperObject.mapperObjName}s(){
        List<${mapperObject.mapperObjName}> ${mapperObject.mapperObjName?uncap_first}s = new ArrayList();
        <#list mapperObject.mapperObjectItems as mapperItem>
        ${mapperItem.tableProperty?uncap_first}s = ${mapperObject.mapperObjName?uncap_first}Mapper.search${mapperItem.tableProperty?cap_first}s();
        </#list>
        return ${mapperObject.mapperObjName?uncap_first}s;
    }


    @Override
    protected void save(${mapperObject.mapperObjName} ${mapperObject.mapperObjName?uncap_first}) {

        for (PrePaymentsLine item:prePayments.getprePaymentsLines()) {
            prePaymentsMapper.insertPrePaymentsLine(item);
        }
    <#list mapperObject.mapperObjectItems as mapperItem>
        ${mapperObject.mapperObjName?uncap_first}Mapper.insert${mapperItem.tableProperty?cap_first}(${mapperItem.tableProperty?uncap_first});
    </#list>
    }

    @Override
    protected void update(${mapperObject.mapperObjName} ${mapperObject.mapperObjName?uncap_first}) {

    }

    @Override
    protected void delete(${mapperObject.mapperObjName} ${mapperObject.mapperObjName?uncap_first}) {

    }

    @Override
    protected void callTranscation(${mapperObject.mapperObjName?cap_first} ${mapperObject.mapperObjName?uncap_first}, String transType) {
        HashMap<String,String> transParam = new HashMap<>();
        transParam = setTransParam(transParam,${mapperObject.mapperObjName?uncap_first},transType);
        TranscationResult result = transcationNoticeMapper.callTranscationNotice(transParam);
        if(!result.getErrorCode().equals("0")){
            throw new BusinessObjectException(result.getErrorCode(), result.getMessage());
        }
    }

    private HashMap<String,String> setTransParam(HashMap<String,String> transParam,${mapperObject.mapperObjName?cap_first} ${mapperObject.mapperObjName?uncap_first},String transType){
        transParam.put("object_type",${mapperObject.mapperObjName?uncap_first}.getObjectCode());
        transParam.put("transaction_type",transType);
        transParam.put("num_of_cols_in_key","1");
        transParam.put("list_of_key_cols_tab_del","DocEntry");
        transParam.put("list_of_cols_val_tab_del",${mapperObject.mapperObjName?uncap_first}.getDocEntry().toString());
        return transParam;
    }
</#if>
}