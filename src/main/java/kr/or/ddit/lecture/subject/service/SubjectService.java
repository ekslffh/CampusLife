package kr.or.ddit.lecture.subject.service;

import kr.or.ddit.common.service.ServiceIfs;
import kr.or.ddit.lecture.subject.vo.SubjectEssentialVO;
import kr.or.ddit.lecture.subject.vo.SubjectVO;

public interface SubjectService extends ServiceIfs<SubjectVO> {
	
	public boolean insertSubjectEss(SubjectEssentialVO subEvo);
}
