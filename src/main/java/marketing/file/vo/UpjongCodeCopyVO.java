package marketing.file.vo;

public class UpjongCodeCopyVO {
	private String upJongCDCopy; 
	private String upJongNMCopy;
	
	public String getUpJongCDCopy() {
		return upJongCDCopy;
	}
	public void setUpJongCDCopy(String upJongCDCopy) {
		this.upJongCDCopy = upJongCDCopy;
	}
	public String getUpJongNMCopy() {
		return upJongNMCopy;
	}
	public void setUpJongNMCopy(String upJongNMCopy) {
		this.upJongNMCopy = upJongNMCopy;
	}
	
	@Override
	public String toString() {
		return "UpjongCodeCopyVO [upJongCDCopy=" + upJongCDCopy + ", upJongNMCopy=" + upJongNMCopy + "]";
	}
}
