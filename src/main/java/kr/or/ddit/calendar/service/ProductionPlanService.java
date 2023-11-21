package kr.or.ddit.calendar.service;

import java.util.List;
import java.util.Map;

public interface ProductionPlanService {
	/**
	 * @return 일정 리스트를 반환
	 */
	List<Map<String, Object>> getProductionAllPlanList();

}
