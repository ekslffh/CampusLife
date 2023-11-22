package kr.or.ddit.professor.service;

import kr.or.ddit.common.service.ServiceIfs;
import kr.or.ddit.professor.vo.ProfessorVO;

public interface ProfessorService extends ServiceIfs<ProfessorVO> {

	public boolean createProf(ProfessorVO prof);
}
