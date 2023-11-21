package kr.or.ddit.officialAbsence.service;

import java.util.List;

import kr.or.ddit.common.service.ServiceIfs;
import kr.or.ddit.officialAbsence.vo.OfficialAbsCategoVO;
import kr.or.ddit.officialAbsence.vo.OfficialAbsHisVO;

public interface OfficialAbsenceService extends ServiceIfs<OfficialAbsHisVO> {

	/**
	 * 공결종류 전체리스트 조회하기
	 * @return 없으면 size 0 리스트 반환
	 */
	List<OfficialAbsCategoVO> findOffiAbsCtgrList();
}
