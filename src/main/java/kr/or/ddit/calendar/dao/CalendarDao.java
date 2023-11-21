package kr.or.ddit.calendar.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.calendar.vo.CalendarVO;
import kr.or.ddit.common.dao.DaoIfs;

@Mapper
public interface CalendarDao extends DaoIfs<CalendarVO>{
	
}
