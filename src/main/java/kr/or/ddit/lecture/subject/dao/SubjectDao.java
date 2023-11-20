package kr.or.ddit.lecture.subject.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.dao.DaoIfs;
import kr.or.ddit.lecture.subject.vo.SubjectVO;

@Mapper
public interface SubjectDao extends DaoIfs<SubjectVO>{

}
