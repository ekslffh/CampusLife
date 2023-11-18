package kr.or.ddit.professor.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.dao.DaoIfs;
import kr.or.ddit.professor.vo.ProfessorVO;

@Mapper
public interface ProfessorDAO extends DaoIfs<ProfessorVO> {

}
