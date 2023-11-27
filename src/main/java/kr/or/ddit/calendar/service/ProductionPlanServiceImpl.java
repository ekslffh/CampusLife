package kr.or.ddit.calendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.calendar.dao.CalendarDao;
import kr.or.ddit.calendar.vo.CalendarVO;

@Service
public class ProductionPlanServiceImpl implements ProductionPlanService{
	@Inject
	private CalendarDao calDAO;
	
	@Override
	public List<CalendarVO> getProductionAllPlanList() {
		
		return calDAO.selectAll();
	}

	@Override
	public String insertCal(CalendarVO calInfo) {
		calDAO.insert(calInfo);
		return null;
	}

}
