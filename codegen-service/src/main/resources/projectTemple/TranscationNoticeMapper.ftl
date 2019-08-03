package ${mapperObject.packageName};

import com.avatech.edi.model.dto.TranscationResult;
import java.util.HashMap;

public interface TranscationNoticeMapper {

    TranscationResult callTranscationNotice(HashMap<String,String> para);
}
