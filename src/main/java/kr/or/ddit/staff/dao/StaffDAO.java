package kr.or.ddit.staff.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.dao.DaoIfs;
import kr.or.ddit.staff.vo.StaffVO;

@Mapper
public interface StaffDAO extends DaoIfs<StaffVO> {
	
	//ㄱㅈㅅㅅ
	public int insertStf(StaffVO sft);
	
	List<StaffVO> selectStfList();
}
