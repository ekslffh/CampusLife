package kr.or.ddit.common.service;

import java.util.List;

import kr.or.ddit.exception.PKNotFoundException;

public interface ServiceIfs<T> {
	/**
	 * 전체목록조회
	 * @return 전체목록리스트 없으면 size 0인 리스트 반환
	 */
	List<T> findAll(); 
	
	/**
	 * 특정데이터조회
	 * @param id : 특정데이터를 조회할 수 있는 아이디(PK)
	 * @return 특정데이터 없으면 PKNotFoundException반환
	 */
	T findById(String id) throws PKNotFoundException;
	
	T findByIds(T obj) throws PKNotFoundException; // 복합키인 경우 해당 메서드로 찾기
	
	/**
	 * 데이터삽입
	 * @param obj : DB에 넣을 데이터가 들어있는 객체
	 * @return DB 삽입작업이 성공하면 true, 실패하면 false가 반환된다.
	 */
	boolean create(T obj);
	
	/**
	 * 데이터수정
	 * @param obj : DB에 넣을 데이터가 들어있는 객체
	 * @return DB 수정작업이 성공하면 true, 실패하면 false가 반환된다.
	 */
	boolean modify(T obj);
	
	/**
	 * 데이터삭제
	 * @param id : 특정데이터를 삭제할 수 있는 아이디(PK)
	 * @return 삭제작업이 성공하면 true, 실패하면 false가 반환된다.
	 */
	boolean removeById(String id);
}