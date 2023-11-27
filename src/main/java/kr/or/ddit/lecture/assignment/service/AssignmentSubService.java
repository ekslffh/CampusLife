package kr.or.ddit.lecture.assignment.service;

import java.util.List;

import kr.or.ddit.common.service.ServiceIfs;
import kr.or.ddit.lecture.assignment.vo.AssignmentSubVO;

public interface AssignmentSubService extends ServiceIfs<AssignmentSubVO> {

	/**
	 * 특정과제기준으로 제출데이터 리스트 조회하기
	 * @param asNo : 과제번호
	 * @return 과제a에 대한 제출리스트 반환
	 */
	List<AssignmentSubVO> findListByAssignment(String asNo);
	
	/**
	 * 학생기준으로 제출데이터 리스트 조회하기
	 * @param stdNo : 학번
	 * @return 학생a에 대한 제출리스트 반환
	 */
	List<AssignmentSubVO> findListByStudent(String stdNo);
	
	/**
	 * 과제번호와 학번을 가지고 데이터 삭제하기
	 * @param asub 필수속성 : 과제번호, 학번
	 * @return 삭제된 데이터의 개수 > 0 : 성공
	 */
	boolean removeByAsNoAndStdNo(AssignmentSubVO asub);
}
