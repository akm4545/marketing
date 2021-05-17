package marketing.main.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Iterator;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Service("hangjungCodeService")
public class MainServiceImpl implements MainService{
	JsonObject jusoJSON;
	boolean keyItrSw = true; //재귀함수 종료 스위치
	String jusoCode = ""; //주소 코드 분류
	
	@Override
	public String searchJosuCode(int jusoIndex, String jusoKeyword, String jusoCodeNum){
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/baroApi"); /*URL*/
			
			urlBuilder.append("?" + URLEncoder.encode("resId","UTF-8") + "=" + URLEncoder.encode("dong", "UTF-8")); /*요청 분류*/
			
			if(jusoIndex == 0) {
				//시 코드 조회
				keyItrSw = true;
				//시 코드 분류
				jusoCode = "ctprvnCd";
				
				urlBuilder.append("&" + URLEncoder.encode("catId","UTF-8") + "=" + URLEncoder.encode("mega", "UTF-8"));
			}else if(jusoIndex == 1) {
				//시군구 코드 조회
				keyItrSw = true;
				//시군구 코드 분류
				jusoCode = "signguCd";
				
				urlBuilder.append("&" + URLEncoder.encode("catId","UTF-8") + "=" + URLEncoder.encode("cty", "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("ctprvnCd","UTF-8") + "=" + jusoCodeNum.replace("\"", ""));
			}else if(jusoIndex == 2) {
				//행정동 코드 조회
				keyItrSw = true;
				//행정동 코드 분류
				jusoCode = "adongCd";
				
				urlBuilder.append("&" + URLEncoder.encode("catId","UTF-8") + "=" + URLEncoder.encode("admi", "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("signguCd","UTF-8") + "=" + jusoCodeNum.replace("\"", ""));
			}
			
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 요청 데이터 타입*/
	        
	        URL url = new URL(urlBuilder.toString());
	        
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        BufferedReader rd;
	        
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
	        
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        
	        jusoJSON = new Gson().fromJson(sb.toString(), JsonObject.class);
	        
	        jusoJSON = recurseKeys(jusoJSON, jusoCode, jusoKeyword);
	        
	        rd.close();
	        conn.disconnect();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return jusoJSON.get(jusoCode).toString();
	}
	
	//업종 코드 조회
	@Override
	public String searchUpjongCode(int upjongIndex, String upjongCode) throws Exception{
		String param = "";
		StringBuilder urlBuilder = null;
		
		//if(upjongIndex == 0) {
		//	param = "?";
			
		//	urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/largeUpjongList"); /*업종 대분류*/			
	//	}
//	else 
		if(upjongIndex == 1) {
			param = "&";
			
			urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/middleUpjongList"); /*업종 중분류*/
			urlBuilder.append("?" + URLEncoder.encode("indsLclsCd","UTF-8") + "O"); /*업종 대분류*/
		}
		//else if(upjongIndex == 2) {
		//	param = "&";
			
		//	urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/smallUpjongList"); /*업종 소분류*/
		//	urlBuilder.append("?" + URLEncoder.encode("indsLclsCd","UTF-8") + "O"); /*업종 대분류*/
		//	urlBuilder.append("&" + URLEncoder.encode("indsMclsCd","UTF-8") + "O"); /*업종 중분류*/
		//}
		
		
		urlBuilder.append(param + URLEncoder.encode("ServiceKey","UTF-8") + "=yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 요청 데이터 타입*/
        
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb.toString());
        
        rd.close();
        conn.disconnect();
        
        return null;
	}
	
	//최종 주소로 상권조회
	@Override
	public JsonArray storeListInDong(String jusoCodeNum, String code) throws Exception{
		//yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D 서비스키
		//필요 응답 메세지 항목
		//bizesNm 상호명, indsSclsNm 상권업종 대분류명, InoAdr 지번주소, lon 경도, lat 위도  
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/storeListInDong"); /*URL*/
		
		urlBuilder.append("?" + URLEncoder.encode("divId","UTF-8") + "=" + URLEncoder.encode("adongCd", "UTF-8")); /*요청 분류*/
		urlBuilder.append("&" + URLEncoder.encode("key","UTF-8") + "=" + jusoCodeNum.replace("\"", "")); /*행정동*/
		urlBuilder.append("&" + URLEncoder.encode("indsSclsCd","UTF-8") + "=" + code); /*상권업종 소분류코드*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*한 페이지 결과 수*/
        
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        conn.disconnect();
        
        JsonObject storeJson = new Gson().fromJson(sb.toString(), JsonObject.class);
        
        //재귀함수 안쓰고 고정 깊이를 가진 Jons객체에서 꺼내오기
        storeJson = (JsonObject) storeJson.get("body");
        JsonArray storeJsonArr = (JsonArray) storeJson.get("items");
        
        //Type type = new TypeToken<ArrayList<StoreVO>>(){}.getType();
        //List<StoreVO> storeVOS = new Gson().fromJson(storeJsonArr.toString(), type);
        
        return storeJsonArr;
	}
	
	public JsonObject recurseKeys(JsonObject jObj, String findKey, String findValue) throws Exception {
		jObj = (JsonObject) jObj.get("body");
        JsonArray storeJsonArr = (JsonArray) jObj.get("items");
        
        System.out.println(findKey);
        for(int i=0; i<storeJsonArr.size(); i++) {
        	JsonObject itemJson = (JsonObject) storeJsonArr.get(i);
        	
        	Iterator<String> keyItr = itemJson.keySet().iterator();
        	while (keyItr.hasNext()) {
        		String key = keyItr.next();
        		if(itemJson.get(key).toString().replace("\"", "").equals(findValue)) {
        			return itemJson;
        		}				
			}
        }
        return null;
	}
	
	@Override
	public JsonObject storeListInDongAvg(String jusoCodeNum, String upJongKey) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("https://sg.sbiz.or.kr/godo/getAvgAmtInfo.json"); /*URL*/
		
		urlBuilder.append("?" + URLEncoder.encode("admiCd","UTF-8") + "=" + jusoCodeNum.replace("\"", "").substring(0,8)); /*요청 분류*/
		urlBuilder.append("&" + URLEncoder.encode("upjongCd","UTF-8") + "=" + upJongKey); /*행정동*/
		urlBuilder.append("&" + URLEncoder.encode("simpleLoc","UTF-8") + "=dsad+dasd+dsad" ); /*상권업종 소분류코드*/
        
        URL url = new URL(urlBuilder.toString());
        
        System.out.println(url.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        conn.disconnect();
        
        JsonObject dongAvgJson = new Gson().fromJson(sb.toString(), JsonObject.class);
        JsonObject latelyDongAvgJson = null;
        
        try {
        	JsonArray dongAvgJsonArr = (JsonArray) dongAvgJson.get("annualSales");        	
        	latelyDongAvgJson = (JsonObject) dongAvgJsonArr.get(0);
        }catch (ClassCastException e) {
			latelyDongAvgJson = new Gson().fromJson("{\"saleAmt\":\"0\"}", JsonObject.class);
		}
        
        return latelyDongAvgJson;
	}
	
	//깊이가 고정이지 않은 코드를 위한 재귀함수 힌트 
/*	@Override
 *	public JsonObject recurseKeys(JsonObject jObj, String findKey, String findValue) throws Exception {
 *		JsonObject value = null;
 *		
 *	    Iterator<String> keyItr = jObj.keySet().iterator();
 *	    
 *	    while(keyItr.hasNext() && keyItrSw) {
 *	        String key = keyItr.next();	
 *	        
 *	        if(jObj.get(key).toString().replace("\"", "").equals(findValue)) {
 *	        	System.out.println("지역 : " + jObj.get(key).toString() + "지역코드 : " + jObj.get(findKey));
 *	        	
 *	        	keyItrSw = false;
 *	        	return jObj;
 *	        }else if (jObj.get(key) instanceof JsonObject) {
 *	        	value = (JsonObject)jObj.get(key);
 *	        	value = recurseKeys(value, findKey, findValue);
 *	        	if(!keyItrSw) {
 *	        		jObj = value;
 *	        	}
 *	        }else if(jObj.get(key) instanceof JsonArray) {
 *	        	JsonArray valueArr = new JsonArray();
 *	        	
 *	        	valueArr.addAll((JsonArray) jObj.get(key));
 *	        	
 *	        	for(int i=0; i<valueArr.size(); i++) {
 *	        		if(valueArr.get(i).isJsonObject() && keyItrSw) {
 *	        			jObj = recurseKeys((JsonObject)valueArr.get(i), findKey, findValue);
 *	        		}
 *	        	}
 *	        }
 *	    }
 *	    return jObj;
 *	}
 */
}
