package marketing.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import marketing.main.dao.UpJongCodeListDAO;
import marketing.main.vo.UpJongVO;

@Service("upJongCodeListService")
public class UpJongCodeListServiceImpl implements UpJongCodeListService{
	
	@Resource(name = "upJongCodeListDAO")
	UpJongCodeListDAO upJongCodeListDAO;
	
	@Override
	public Map<String,List<UpJongVO>> getUpjongList(String upJongCode) throws Exception {
		Map<String,List<UpJongVO>> upJongMap = new HashMap<String, List<UpJongVO>>();
		
		List<String> upJongNm = upJongCodeListDAO.getUpjongNm(upJongCode); 
		List<UpJongVO> upJongList = upJongCodeListDAO.getUpJongList(upJongCode);
		
		for(int i=0; i<upJongNm.size(); i++) {
			List<UpJongVO> tempList = new ArrayList<UpJongVO>();
			upJongMap.put(upJongNm.get(i), tempList);
			for(int j=0; j<upJongList.size(); j++) {
				if(upJongNm.get(i).equals(upJongList.get(j).getIndsLclsNm())) {
					upJongMap.get(upJongNm.get(i)).add(upJongList.get(j));
					//System.out.println("반복" + j + upJongMap.toString());
				}
			}
		}
		return upJongMap;
	}
}
