package marketing.main.vo;

public class StoreVO {
	private String bizesNm; //상호명
	private String indsSclsNm; //상권업종 대분류명
	private String InoAdr; //지번주소
	private String lon; //경도
	private String lat; //위도
	
	public String getBizesNm() {
		return bizesNm;
	}
	public void setBizesNm(String bizesNm) {
		this.bizesNm = bizesNm;
	}
	public String getIndsSclsNm() {
		return indsSclsNm;
	}
	public void setIndsSclsNm(String indsSclsNm) {
		this.indsSclsNm = indsSclsNm;
	}
	public String getInoAdr() {
		return InoAdr;
	}
	public void setInoAdr(String inoAdr) {
		InoAdr = inoAdr;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	
	@Override
	public String toString() {
		return "StoreVO [bizesNm=" + bizesNm + ", indsSclsNm=" + indsSclsNm + ", InoAdr=" + InoAdr + ", lon=" + lon
				+ ", lat=" + lat + "]";
	}
}
 