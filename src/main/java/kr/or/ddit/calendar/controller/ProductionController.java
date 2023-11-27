package kr.or.ddit.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.logging.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.calendar.service.ProductionPlanService;
import kr.or.ddit.calendar.vo.CalendarVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("cal/production/")
@Slf4j
public class ProductionController {	
	private final ProductionPlanService productionPlanService;
	
	public ProductionController(ProductionPlanService productionPlanService) {
		this.productionPlanService = productionPlanService;
	}

	@RequestMapping(value="monthPlan", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> monthPlan() {
		List<CalendarVO> list = productionPlanService.getProductionAllPlanList();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();		
		
		for(int i=0; i < list.size(); i++) {			
			hash.put("title", list.get(i).getCalTitle()); // 제목
			hash.put("content", list.get(i).getCalContent()); // 내용
			hash.put("start", list.get(i).getCalStartDt()); // 시작일자
			hash.put("end", list.get(i).getCalEndDt()); // 종료일자
			
			jsonObj = new JSONObject(hash); // 중괄호 {key:value , key:value, key:value}
			jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
		}
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return jsonArr;
	}
	
	@RequestMapping("addCal.do")
	public void insertCal(
			@RequestBody CalendarVO calInfo
			) {
		String logicalViewName = null;
		boolean result = true;
		productionPlanService.insertCal(calInfo);
	}
}