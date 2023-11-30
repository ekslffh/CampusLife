package kr.or.ddit.classRegi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.classRegi.dao.ClassRegiDao;
import kr.or.ddit.classRegi.vo.ClassRegiVO;
import kr.or.ddit.exception.PKNotFoundException;

@Service
public class ClassRegiServiceImpl implements ClassRegiService {

	@Inject
	private ClassRegiDao claDao;
	
	@Override
	public List<ClassRegiVO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClassRegiVO findById(String id) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClassRegiVO findByIds(ClassRegiVO obj) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(ClassRegiVO obj) {
		int cnt = claDao.insert(obj);
		
		return cnt > 0;
	}

	@Override
	public boolean modify(ClassRegiVO obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
