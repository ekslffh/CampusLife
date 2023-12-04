package kr.or.ddit.lecture.assignment.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.student.vo.StudentVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "asubAsNo", "asubStdNo" })
public class AssignmentSubVO {
	@NotBlank
	private String asubAsNo;			// 과제번호
	@NotBlank
	private String asubStdNo;			// 학번
	
	private StudentVO student;
	
	private String asubFile;			// 첨부파일 id
	
	private MultipartFile[] subFiles;
	private AtchFileVO fileGroup;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime asubCrtTm; 	// 제출일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime asubUpdTm; 	// 수정일시
	private Integer asubScore;			// 과제점수
}
