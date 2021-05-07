package marketing.main.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.fabric.xmlrpc.base.Array;

import marketing.main.service.MainService;

@Controller
public class MainController {	
	
	@Resource(name = "hangjungCodeService")
	MainService hangjungCodeService;
	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(String key) throws Exception {
		String jusoCodeNum = ""; //주소 코드
		
		String[] jusoArr = key.split(" ");
		
		/** 깃허브 업로드 주석
		 * Title : 주소 배열 변수명 변경
		 * Type:
		 * Message : 주소 배열 변수명을 josuArr 에서 jusoArr 로 변경
		 * author: 조찬기
		 */
		for(int i=0; i<jusoArr.length; i++) {
			jusoArr[i] = jusoArr[i].replace(" ", "");
		}
		
		List<String> juso = new ArrayList<>(Arrays.asList(jusoArr));
		
		System.out.println(juso.toString());
		System.out.println(key);
		
		for(int i=0; i<juso.size(); i++) {
			jusoCodeNum = hangjungCodeService.searchJosuCode(i, juso.get(i), jusoCodeNum); //시 코드 조회
		}
	}
}