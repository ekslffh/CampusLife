package kr.or.ddit.lecture.subject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.lecture.subject.dao.SubjectDao;
import kr.or.ddit.lecture.subject.vo.SubjectVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SubjectServiceImpl implements SubjectService {

	private final SubjectDao subDao;
	
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
	public int create(SubjectVO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify(SubjectVO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeById(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
