package kr.or.ddit.officialAbsence.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.dao.DaoIfs;
import kr.or.ddit.officialAbsence.vo.OfficialAbsCategoVO;
import kr.or.ddit.officialAbsence.vo.OfficialAbsHisVO;

@Mapper
public interface OfficialAbsenceDao extends DaoIfs<OfficialAbsHisVO> {

	/**
	 * 공결종류 전체리스트 조회하기
	 * @return 없으면 size 0 리스트 반환
	 */
	List<OfficialAbsCategoVO> selectOffiAbsCtgrList();
}
