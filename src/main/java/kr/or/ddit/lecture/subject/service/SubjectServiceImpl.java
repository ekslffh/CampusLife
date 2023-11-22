package kr.or.ddit.lecture.subject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.lecture.subject.dao.SubjectDao;
import kr.or.ddit.lecture.subject.vo.SubjectVO;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Inject
	private SubjectDao subDao;
	
	@Override
	public List<SubjectVO> findAll() {
		return subDao.selectAll();
	}

	@Override
	public SubjectVO findById(String id) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SubjectVO findByIds(SubjectVO obj) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(SubjectVO obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(SubjectVO obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
