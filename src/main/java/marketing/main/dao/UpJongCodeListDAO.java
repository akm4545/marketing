package marketing.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import marketing.main.vo.UpJongVO;

@Mapper("upJongCodeListDAO")
public interface UpJongCodeListDAO {
	public List<UpJongVO> getUpJongList(@Param("upJongCode") String upJongCode) throws Exception;

	public List<String> getUpjongNm(String upJongCode) throws Exception;

	public String getCopyUpJongCode(String upJongKey) throws Exception;
}