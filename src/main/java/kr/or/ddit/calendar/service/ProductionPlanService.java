package kr.or.ddit.calendar.service;

import java.util.List;

import kr.or.ddit.calendar.vo.CalendarVO;
import kr.or.ddit.common.service.ServiceIfs;

public interface ProductionPlanService {
	List<CalendarVO> getProductionAllPlanList();

	public void insertCal(CalendarVO calInfo);

	public void updateCal(CalendarVO updateCalInfo);

	public void deleteCal(String calInfo);
}