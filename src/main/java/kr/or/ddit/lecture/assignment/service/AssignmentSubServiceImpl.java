package kr.or.ddit.lecture.assignment.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.lecture.assignment.dao.AssignmentSubDao;
import kr.or.ddit.lecture.assignment.vo.AssignmentSubVO;

@Service
public class AssignmentSubServiceImpl implements AssignmentSubService {

	@Inject
	private AssignmentSubDao assignmentSubDao;
	
	@Inject
	private AtchFileService atchService; 
	
	@Value("#{appInfo.asubPath}")
	private Resource asubPath;
	
	@Override
	public List<AssignmentSubVO> findListByAssignment(String asNo) {
		return assignmentSubDao.selectListByAssignment(asNo);
	}

	@Override
	public List<AssignmentSubVO> findListByStudent(String stdNo) {
		return assignmentSubDao.selectListByStudent(stdNo);
	}
	
	@Override
	public AssignmentSubVO findByIds(AssignmentSubVO obj) throws PKNotFoundException {
		AssignmentSubVO assignmentSub = assignmentSubDao.selectByIds(obj);
		if (assignmentSub == null) throw new PKNotFoundException(MessageFormat.format("해당하는 제출내역 없음 => 과목:{0} / 학번:{1}", obj.getAsubAsNo(), obj.getAsubStdNo()));
		return assignmentSub; 
	}
	
	private void processAtchFileGroup(AssignmentSubVO asub) {
		MultipartFile[] subFiles = asub.getSubFiles();
		if (subFiles == null) return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile subFile : subFiles) {
			if (subFile.isEmpty()) continue;
			detailList.add(new AtchFileDetailVO(subFile));
		}
		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			// 1. 첨부파일의 메타 데이터 저장
			// 2. 첨부파일의 2진 데이터 저장
			try {
				if (StringUtils.isNotBlank(asub.getAsubFile())) {
					// 운항일지 수정인경우 첨부파일 데이터 전부 삭제하고 다시 생성
					atchService.removeAtchFileGroup(asub.getAsubFile(), asubPath);
				}
				// 운항일지 작성
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, asubPath);
				asub.setAsubFile(fileGroup.getAtchFileId());
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	@Override
	public boolean create(AssignmentSubVO asub) {
		processAtchFileGroup(asub);
		return assignmentSubDao.insert(asub) > 0;
	}

	@Override
	public boolean modify(AssignmentSubVO asub) {
		processAtchFileGroup(asub);
		return assignmentSubDao.update(asub) > 0;
	}

	@Override
	public boolean removeByAsNoAndStdNo(AssignmentSubVO asub) {
		AssignmentSubVO findEntity = assignmentSubDao.selectByIds(asub);
		// 만약 파일이 존재하면 이것부터 지우기
		boolean success = true;
		if (findEntity.getAsubFile() != null) {
			try {
				success = atchService.removeAtchFileGroup(findEntity.getAsubFile(), asubPath);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		// 성공적으로 파일지웠으면 이제 제출데이터 지우기
		if (success) {
			return assignmentSubDao.deleteByAsNoAndStdNo(asub) > 0;
		}
		return false;
	}
	
	@Override
	public List<AssignmentSubVO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssignmentSubVO findById(String id) throws PKNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
