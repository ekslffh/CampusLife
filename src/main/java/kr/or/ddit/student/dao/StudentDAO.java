package kr.or.ddit.student.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.dao.DaoIfs;
import kr.or.ddit.staff.vo.StaffVO;
import kr.or.ddit.student.vo.StudentVO;

@Mapper
public interface StudentDAO extends DaoIfs<StudentVO> {

	public int insertStd(StudentVO std);
}
