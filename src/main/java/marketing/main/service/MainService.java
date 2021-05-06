package marketing.main.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Service("hangjungCodeService")
public class MainService {

	public void searchJosuCode(int josuIndex, String josuKeyword){
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/baroApi"); /*URL*/
			
			if(josuIndex == 0) {
				//시 코드 조회
				urlBuilder.append("?" + URLEncoder.encode("resId","UTF-8") + "=" + URLEncoder.encode("dong", "UTF-8")); /*요청 분류*/
				urlBuilder.append("&" + URLEncoder.encode("catId","UTF-8") + "=" + URLEncoder.encode("mega", "UTF-8")); /*시 요청*/
		        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 요청 데이터 타입*/
			}else if(josuIndex == 1) {
				//시군구 코드 조회
				urlBuilder.append("?" + URLEncoder.encode("resId","UTF-8") + "=" + URLEncoder.encode("dong", "UTF-8")); /*요청 분류*/
				urlBuilder.append("&" + URLEncoder.encode("catId","UTF-8") + "=" + URLEncoder.encode("cty", "UTF-8")); /*시 요청*/
				urlBuilder.append("&" + URLEncoder.encode("ctprvnCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*구 요청 현재 서울시 넣어놓음 나중에 주입*/
		        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 요청 데이터 타입*/
			}else if(josuIndex == 2) {
				//행정동 코드 조회
				urlBuilder.append("?" + URLEncoder.encode("resId","UTF-8") + "=" + URLEncoder.encode("dong", "UTF-8")); /*요청 분류*/
				urlBuilder.append("&" + URLEncoder.encode("catId","UTF-8") + "=" + URLEncoder.encode("admi", "UTF-8")); /*시 요청*/
				urlBuilder.append("&" + URLEncoder.encode("signguCd","UTF-8") + "=" + URLEncoder.encode("11470", "UTF-8")); /*구 요청 현재 서울시 넣어놓음 나중에 주입*/
		        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 요청 데이터 타입*/
			}
			
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
	        
	        JsonObject jusoJSON = new Gson().fromJson(sb.toString(), JsonObject.class);
	        
	        System.out.println("전체목록 조회");
	        System.out.println(jusoJSON.toString());
	        
	        jusoJSON = recurseKeys(jusoJSON, "items");
	        
	        System.out.println(jusoJSON.get("ctprvnCd"));
	        
	        rd.close();
	        conn.disconnect();
	        //System.out.println(sb.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//최종 주소로 상권조회
	public void temp() throws Exception{
		//yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D 서비스키
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/storeListInDong"); /*URL*/
		
		urlBuilder.append("?" + URLEncoder.encode("divId","UTF-8") + "=" + URLEncoder.encode("ctprvnCd", "UTF-8")); /*요청 분류*/
		urlBuilder.append("&" + URLEncoder.encode("key","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*행정동*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("yzW%2BB0UU102pdMQBsBDX45wAOqDSIpO7azfCQl0RV9HmD7mpv75mbv13mLIWErmt20cjuDaM%2BUQwThrntMoyAQ%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
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
        System.out.println(sb.toString());
	}
	
	public JsonObject recurseKeys(JsonObject jObj, String findKey) throws Exception { //여기에 벨류로 교체
		JsonObject value = null;
		
	    Iterator<String> keyItr = jObj.keySet().iterator();

	    while(keyItr.hasNext()) {
	        String key = keyItr.next();
	        if (key == findKey) {
	        	return (JsonObject)jObj.get(key);
	        }else if(jObj.get(key) instanceof JsonObject){
	        	value = (JsonObject) jObj.get(key);
	        	recurseKeys(value, findKey);
	        }
	    }
	    
	    return value;
	}
}