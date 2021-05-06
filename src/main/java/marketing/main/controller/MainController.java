package marketing.main.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import marketing.main.service.MainService;

@Controller
public class MainController {
	
	@Resource(name = "hangjungCodeService")
	MainService hangjungCodeService;
	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(String key) throws Exception {
		System.out.println("시 코드 조회");
		//hangjungCodeService.searchCatId(); //시 코드 조회
		System.out.println("------------------------------------");
		
		System.out.println("시군구 코드 조회");
		//hangjungCodeService.searchCtpvnCd(); //시군구 코드 조회
		System.out.println("------------------------------------");
		
		System.out.println("행정동 코드 조회");
		hangjungCodeService.searchAdongCd(); //행정동 코드 조회
		System.out.println("------------------------------------");
	}
}