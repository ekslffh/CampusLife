package kr.or.ddit.lecture.assignment.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "asubAsNo", "asubStdNo" })
public class AssignmentSubVO {
	@NotBlank
	private String asubAsNo;			// 과제번호
	@NotBlank
	private String asubStdNo;			// 학번
	@NotBlank
	private String asubFile;			// 첨부파일
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime asubCrtTm; 	// 제출일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime asubUpdTm; 	// 수정일시
	@NotBlank
	private Integer asubScore;			// 과제점수
}
