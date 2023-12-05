package kr.or.ddit.student.service;

import java.util.List;

import kr.or.ddit.common.service.ServiceIfs;
import kr.or.ddit.student.vo.StudentVO;

public interface StudentService extends ServiceIfs<StudentVO> {

	public boolean createStd(StudentVO std);
	
//	public StudentVO retrieveStd(String stdNo);
	
}
