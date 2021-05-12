package marketing.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import marketing.main.dao.UpJongCodeListDAO;
import marketing.main.vo.UpJongVO;

@Service("upJongCodeListService")
public class UpJongCodeListServiceImpl implements UpJongCodeListService{
	
	@Resource(name = "upJongCodeListDAO")
	UpJongCodeListDAO upJongCodeListDAO;
	
	@Override
	public List<UpJongVO> getUpjongList(String upJongCode) throws Exception {
		return upJongCodeListDAO.getUpJongList(upJongCode);
	}
}
