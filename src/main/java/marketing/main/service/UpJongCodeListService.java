package marketing.main.service;

import java.util.List;
import java.util.Map;

import marketing.main.vo.UpJongVO;

public interface UpJongCodeListService {

	Map<String, List<UpJongVO>> getUpjongList(String upJongCode) throws Exception;

}
