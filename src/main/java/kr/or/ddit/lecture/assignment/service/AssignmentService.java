package kr.or.ddit.lecture.assignment.service;

import java.util.List;

import kr.or.ddit.common.service.ServiceIfs;
import kr.or.ddit.lecture.assignment.vo.AssignmentVO;

public interface AssignmentService extends ServiceIfs<AssignmentVO> {
	/**
	 * 특정 강의번호 기준으로 전체 과제리스트 조회하기
	 * @param lecNo : 강의번호
	 * @return 해당강의에 등록된 모든 과제리스트 정보, 없으면 size 0 리스트 반환
	 */
	List<AssignmentVO> findListByLecture(String lecNo);
}
