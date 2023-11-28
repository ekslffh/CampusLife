package kr.or.ddit.lecture.assignment.service;

import java.text.MessageFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.lecture.assignment.dao.AssignmentSubDao;
import kr.or.ddit.lecture.assignment.vo.AssignmentSubVO;

@Service
public class AssignmentSubServiceImpl implements AssignmentSubService {

	@Inject
	private AssignmentSubDao assignmentSubDao;
	
	@Override
	public List<AssignmentSubVO> findListByAssignment(String asNo) {
		return assignmentSubDao.selectListByAssignment(asNo);
	}

	@Override
	public List<AssignmentSubVO> findListByStudent(String stdNo) {
		return assignmentSubDao.selectListByStudent(stdNo);
	}
	
	@Override
	public AssignmentSubVO findByIds(AssignmentSubVO obj) throws PKNotFoundException {
		AssignmentSubVO assignmentSub = assignmentSubDao.selectByIds(obj);
		if (assignmentSub == null) throw new PKNotFoundException(MessageFormat.format("해당하는 제출내역 없음 => 과목:{0} / 학번:{1}", obj.getAsubAsNo(), obj.getAsubStdNo()));
		return assignmentSub; 
	}
	
	@Override
	public boolean create(AssignmentSubVO obj) {
		return assignmentSubDao.insert(obj) > 0;
	}

	@Override
	public boolean modify(AssignmentSubVO obj) {
		return assignmentSubDao.update(obj) > 0;
	}

	@Override
	public boolean removeByAsNoAndStdNo(AssignmentSubVO asub) {
		return assignmentSubDao.deleteByAsNoAndStdNo(asub) > 0;
	}
	
	@Override
	public List<AssignmentSubVO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssignmentSubVO findById(String id) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
