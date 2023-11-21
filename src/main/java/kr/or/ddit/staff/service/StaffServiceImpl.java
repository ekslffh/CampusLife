package kr.or.ddit.staff.service;

import java.text.MessageFormat;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.staff.dao.StaffDAO;
import kr.or.ddit.staff.vo.StaffVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService {

	private final StaffDAO staffDao;
	
	@Override
	public List<StaffVO> findAll() {
		return staffDao.selectAll();
	}

	@Override
	public StaffVO findById(String id) throws PKNotFoundException {
		StaffVO findEntity = staffDao.selectById(id);
		if (findEntity == null) throw new PKNotFoundException(MessageFormat.format("해당하는 교직원계정이 존재하지 않습니다 : {}", id));
		return findEntity;
	}

	@Override
	public StaffVO findByIds(StaffVO obj) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(StaffVO obj) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean modify(StaffVO obj) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean removeById(String id) {
		// TODO Auto-generated method stub
		return true;
	}

}
