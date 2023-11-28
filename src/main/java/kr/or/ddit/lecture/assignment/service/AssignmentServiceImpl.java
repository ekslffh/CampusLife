package kr.or.ddit.lecture.assignment.service;

import java.text.MessageFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.lecture.assignment.dao.AssignmentDao;
import kr.or.ddit.lecture.assignment.vo.AssignmentVO;

@Service
public class AssignmentServiceImpl implements AssignmentService {

	@Inject
	private AssignmentDao assignmentDao;
	
	@Override
	public List<AssignmentVO> findListByLecture(String lecNo) {
		return assignmentDao.selectListByLecture(lecNo);
	}
	
	@Override
	public AssignmentVO findById(String id) throws PKNotFoundException {
		AssignmentVO assignment = assignmentDao.selectById(id);
		if (assignment == null) throw new PKNotFoundException(MessageFormat.format("해당하는 과제없음 : {}", id));
		return assignment;
	}
	
	@Override
	public boolean create(AssignmentVO obj) {
		return assignmentDao.insert(obj) > 0;
	}

	@Override
	public boolean modify(AssignmentVO obj) {
		return assignmentDao.update(obj) > 0;
	}

	@Override
	public boolean removeById(String id) {
		return assignmentDao.deleteById(id) > 0;
	}
	
	@Override
	public List<AssignmentVO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssignmentVO findByIds(AssignmentVO obj) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

}
