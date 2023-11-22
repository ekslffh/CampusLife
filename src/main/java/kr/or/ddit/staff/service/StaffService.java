package kr.or.ddit.staff.service;

import kr.or.ddit.common.service.ServiceIfs;
import kr.or.ddit.staff.vo.StaffVO;

public interface StaffService extends ServiceIfs<StaffVO> {
	
	public boolean createStf(StaffVO stf);
	
}
