package kr.or.ddit.student.service;

import java.text.MessageFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.student.dao.StudentDAO;
import kr.or.ddit.student.vo.StudentVO;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDAO studentDao;
	
	@Override
	public List<StudentVO> findAll() {
		return studentDao.selectAll();
	}

	@Override
	public StudentVO findById(String id) throws PKNotFoundException {
		StudentVO findEntity = studentDao.selectById(id);
		if (findEntity == null) throw new PKNotFoundException(MessageFormat.format("해당하는 학생계정이 존재하지 않습니다 : {}", id));
		return findEntity;
	}

	@Override
	public StudentVO findByIds(StudentVO obj) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(StudentVO obj) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean modify(StudentVO obj) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean removeById(String id) {
		// TODO Auto-generated method stub
		return true;
	}

}
