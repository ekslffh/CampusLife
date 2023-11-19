package kr.or.ddit.staff.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.dao.DaoIfs;
import kr.or.ddit.staff.vo.StaffVO;

@Mapper
public interface StaffDAO extends DaoIfs<StaffVO> {

}