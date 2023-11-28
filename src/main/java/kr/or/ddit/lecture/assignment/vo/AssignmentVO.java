package kr.or.ddit.lecture.assignment.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "asNo")
public class AssignmentVO {
	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String asNo; // 					// 과제번호
	@DateTimeFormat(iso = ISO.DATE_TIME)		
	private LocalDateTime asRegTm;					// 등록일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime asStartTm;				// 시작일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime asEndTm;					// 마감일시
	@NotBlank
	private String asTitle;						// 제목
	private String asContent;					// 내용
	private String asFile;						// 첨부파일
	@NotBlank
	private String asLecNo;						// 강의번호
}
