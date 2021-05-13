package marketing.main.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import marketing.main.service.MainServiceImpl;
import marketing.main.service.UpJongCodeListService;
import marketing.main.vo.UpJongVO;

@Controller
public class MainController{	
	
	@Resource(name = "hangjungCodeService")
	MainServiceImpl hangjungCodeService;
	
	@Resource(name = "upJongCodeListService")
	UpJongCodeListService upJongCodeListService;
	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String search(String key) throws Exception {
		String jusoCodeNum = ""; //주소 코드
		String upjongCode = "";
		
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
			//upjongCode = hangjungCodeService.searchUpjongCode(i, upjongCode); //업종코드 조회
		}
		
		//Json List로 변환 참고 코드
		//List<StoreVO> storeVOS = hangjungCodeService.storeListInDong(jusoCodeNum);
		//System.out.println("최종 반환 json" + storeVOS.toString());
		
		return hangjungCodeService.storeListInDong(jusoCodeNum).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "upJongCodeList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String upJongCodeList(String upJongCode) throws Exception{
		Map<String,List<UpJongVO>> upJongListMap = upJongCodeListService.getUpjongList(upJongCode);
		
		String upJongListJson = new Gson().toJson(upJongListMap);
		System.out.println(upJongListJson);
		
		return upJongListJson;
	}
}