<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${mapperObject.packageName}">
    <resultMap id="ResultMap" type="org.edi.freamwork.transcation.TranscationResult">
        <result column="errorCode" property="errorCode" jdbcType="INTEGER" />
        <result column="message" property="message" jdbcType="VARCHAR" />
    </resultMap>

    <parameterMap type="map" id="paramMap">
        <parameter property="object_type" jdbcType="NVARCHAR" mode="IN"/>
        <parameter property="transaction_type" jdbcType="NVARCHAR" mode="IN"/>
        <parameter property="num_of_cols_in_key" jdbcType="INTEGER" mode="IN"/>
        <parameter property="list_of_key_cols_tab_del" jdbcType="NVARCHAR" mode="IN"/>
        <parameter property="list_of_cols_val_tab_del" jdbcType="NVARCHAR" mode="IN"/>
    </parameterMap>

    <select id="callTranscationNotice" statementType="CALLABLE" parameterMap="paramMap" resultMap="ResultMap">
        ${r"{"}call AVA_SP_TransactionNotification_STOCKTASK(
            #${r"{"}object_type, jdbcType = NVARCHAR, mode = IN${r"}"},
            #${r"{"}transaction_type, jdbcType = NCHAR, mode = IN${r"}"},
            #${r"{"}num_of_cols_in_key, jdbcType = INTEGER, mode = IN${r"}"},
            #${r"{"}list_of_key_cols_tab_del, jdbcType = NVARCHAR, mode = IN${r"}"},
            #${r"{"}list_of_cols_val_tab_del, jdbcType = NVARCHAR, mode = IN${r"}"}
        )${r"}"}
    </select>


</mapper>