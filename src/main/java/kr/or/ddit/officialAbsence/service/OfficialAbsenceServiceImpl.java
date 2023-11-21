package kr.or.ddit.officialAbsence.service;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.officialAbsence.dao.OfficialAbsenceDao;
import kr.or.ddit.officialAbsence.vo.OfficialAbsCategoVO;
import kr.or.ddit.officialAbsence.vo.OfficialAbsHisVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OfficialAbsenceServiceImpl implements OfficialAbsenceService {

	private final OfficialAbsenceDao absDao;
	
	@Override
	public List<OfficialAbsHisVO> findAll() {
		return absDao.selectAll();
	}

	@Override
	public OfficialAbsHisVO findById(String id) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OfficialAbsHisVO findByIds(OfficialAbsHisVO obj) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	// 트랜잭션을 통해서 공결내역이 하나만 들어가지 않도록 하나의 작업단위로 묶음.
	@Transactional
	@Override
	public boolean create(OfficialAbsHisVO obj) {
		// lecNo를 강의일정속성에 임시저장해뒀다.
		String lecNo = obj.getOahLsNo();
		
		// 해당 강의가 오늘 수업이 있는지 확인하고 없으면 RuntimeException 던지기
//		 throw new RuntimeException("선택하신 강의는 금일에 수업이 존재하지 않습니다.");
		
		
		// 해당 강의의 금일 강의일정 개수 ex)월요일에 a수업은 1차시, 2차시 총 2시간을 진행한다.
		int classNum = 2;
		
		// 데이터 변경 개수 초기화
		int cnt = 0;
		
		// 넣어줄 때마다 아이디는 다르게 변경! 이후에 for문으로 구현할거임!
		obj.setOahId(UUID.randomUUID().toString().substring(0, 10));
		obj.setOahLsNo("temp1");
		cnt += absDao.insert(obj);
		obj.setOahId(UUID.randomUUID().toString().substring(0, 10));
		obj.setOahLsNo("temp2");
		cnt += absDao.insert(obj);
		
		// classNum만큼 들어가야 정상임
		return cnt >= classNum;
	}

	@Override
	public boolean modify(OfficialAbsHisVO obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<OfficialAbsCategoVO> findOffiAbsCtgrList() {
		return absDao.selectOffiAbsCtgrList();
	}

}
