package kr.or.ddit.security.service;

import java.text.MessageFormat;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.professor.dao.ProfessorDAO;
import kr.or.ddit.professor.vo.ProfessorVO;
import kr.or.ddit.security.vo.AccountInfo;
import kr.or.ddit.security.vo.AccountWrapper;
import kr.or.ddit.staff.dao.StaffDAO;
import kr.or.ddit.staff.vo.StaffVO;
import kr.or.ddit.student.dao.StudentDAO;
import kr.or.ddit.student.vo.StudentVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {

	private final StudentDAO studentDao;

	private final ProfessorDAO professorDao;

	private final StaffDAO staffDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		// 여기에서 사용자명과 사용자 타입을 추출
		String[] parts = username.split("_");
		if (parts.length != 2) {
			throw new UsernameNotFoundException(MessageFormat.format("잘못된 username 형식 : {}", username));
		}

		// 사용자 구분하기 : STD(학생), PRF(교수), STF(교직원)
		String userType = parts[0];
		String actualUsername = parts[1];

		AccountInfo accountInfo = null;
		// 사용자 타입에 따라서 인증하기
		switch (userType) {
		case "STD":
			try {
				StudentVO student = studentDao.selectById(actualUsername);
				accountInfo = new AccountInfo(student.getStdNo(), student.getStdPw(), "STD", "ROLE_USER");
				return new AccountWrapper<StudentVO>(accountInfo, student);
			} catch (PKNotFoundException e) {
				throw new UsernameNotFoundException(MessageFormat.format("{0} 학생계정 없음", actualUsername));
			}
		case "PRF":
			try {
				ProfessorVO professor = professorDao.selectById(actualUsername);
				accountInfo = new AccountInfo(professor.getProfNo(), professor.getProfPw(), "PRF", "ROLE_USER");
				return new AccountWrapper<ProfessorVO>(accountInfo, professor);
			} catch (PKNotFoundException e) {
				throw new UsernameNotFoundException(MessageFormat.format("{0} 교수계정 없음", actualUsername));
			}
		case "STF":
			try {
				StaffVO staff = staffDao.selectById(actualUsername);
				accountInfo = new AccountInfo(staff.getStfNo(), staff.getStfPw(), "STF", "ROLE_ADMIN");
				return new AccountWrapper<StaffVO>(accountInfo, staff);
			} catch (PKNotFoundException e) {
				throw new UsernameNotFoundException(MessageFormat.format("{0} 교직원계정 없음", actualUsername));
			}
		default:
			throw new UsernameNotFoundException(MessageFormat.format("잘못된 사용자 타입 : {0}", userType));
		}

	}

}
