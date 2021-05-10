package marketing.main.service;

import com.google.gson.JsonObject;

public interface MainService {

	String searchJosuCode(int jusoIndex, String jusoKeyword, String jusoCodeNum);

	JsonObject storeListInDong(String jusoCodeNum) throws Exception;

	JsonObject recurseKeys(JsonObject jObj, String findKey, String findValue) throws Exception;

}
