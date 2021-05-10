package marketing.main.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.mysql.fabric.xmlrpc.base.Array;

import marketing.main.service.MainServiceImpl;
import marketing.main.vo.StoreVO;

@Controller
public class MainController{	
	
	@Resource(name = "hangjungCodeService")
	MainServiceImpl hangjungCodeService;
	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public JsonObject search(String key) throws Exception {
		StoreVO storeVO = new StoreVO();
		
		String jusoCodeNum = ""; //주소 코드
		
		String[] jusoArr = key.split(" ");
		
		/** 깃허브 업로드 주석
		 * Title : 주소 배열 변수명 변경
		 * Type:
		 * Message : 주소 배열 변수명을 josuArr 에서 jusoArr 로 변경
		 * Author: 조찬기
		 */
		for(int i=0; i<jusoArr.length; i++) {
			jusoArr[i] = jusoArr[i].replace(" ", "");
		}
		
		List<String> juso = new ArrayList<>(Arrays.asList(jusoArr));
		
		for(int i=0; i<juso.size(); i++) {
			jusoCodeNum = hangjungCodeService.searchJosuCode(i, juso.get(i), jusoCodeNum); //행정동 코드 조회
		}
		try {
			System.out.println("최종 반환 json" + hangjungCodeService.storeListInDong(jusoCodeNum).toString());			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}