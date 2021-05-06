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
		String[] jusoArr = key.split(" ");
		
		/** 깃허브 업로드 주석
		 * Title : 주소 배열 변수명 변경
		 * Message : 주소 배열 변수명을 josuArr 에서 jusoArr 로 변경
		 */
		for(int i=0; i<jusoArr.length; i++) {
			jusoArr[i].replace(" ", "");
		}
		
		List<String> josu = new ArrayList<>(Arrays.asList(jusoArr));
		
		System.out.println(josu.toString());
		System.out.println(key);
		
		for(int i=0; i<josu.size(); i++) {
			hangjungCodeService.searchJosuCode(i, josu.get(i)); //시 코드 조회
		}
	}
}