package marketing.main.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public interface MainService {

	String searchJosuCode(int jusoIndex, String jusoKeyword, String jusoCodeNum);

	JsonArray storeListInDong(String jusoCodeNum, String code) throws Exception;

	JsonObject recurseKeys(JsonObject jObj, String findKey, String findValue) throws Exception;

	String searchUpjongCode(int upjongIndex, String upjongCode)throws Exception;
	
	JsonObject storeListInDongAvg(String jusoCodeNum, String upJongKey) throws Exception;
	
}
