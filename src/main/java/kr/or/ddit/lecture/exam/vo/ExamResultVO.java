package kr.or.ddit.lecture.exam.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "erStdNo", "erExamNo" })
public class ExamResultVO {
	@NotBlank
	private String erStdNo;
	@NotBlank
	private String erExamNo;
	@NotBlank
	private Integer erScore;
	private String erFile;
}
