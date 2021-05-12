package marketing.main.service;

import java.util.List;

import marketing.main.vo.UpJongVO;

public interface UpJongCodeListService {

	List<UpJongVO> getUpjongList(String upJongCode) throws Exception;

}
