package kr.or.ddit.calendar.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.calendar.vo.CalendarVO;

public interface ProductionPlanService {
	/**
	 * @return 일정 리스트를 반환
	 */
	List<CalendarVO> getProductionAllPlanList();

	public String insertCal(CalendarVO calInfo);
}
