package kr.or.ddit.professor.service;

import java.text.MessageFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.professor.dao.ProfessorDAO;
import kr.or.ddit.professor.vo.ProfessorVO;

@Service
public class ProfessorServiceImpl implements ProfessorService {

	@Inject
	private ProfessorDAO professorDao;
	
	@Override
	public List<ProfessorVO> findAll() {
		return professorDao.selectAll();
	}

	@Override
	public ProfessorVO findById(String id) throws PKNotFoundException {
		ProfessorVO findEntity = professorDao.selectById(id);
		if (findEntity == null) throw new PKNotFoundException(MessageFormat.format("해당하는 교수계정이 존재하지 않습니다 : {}", id));
		return findEntity;
	}

	@Override
	public ProfessorVO findByIds(ProfessorVO obj) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	public boolean create(ProfessorVO obj) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean modify(ProfessorVO obj) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean removeById(String id) {
		// TODO Auto-generated method stub
		return true;
	}

}
