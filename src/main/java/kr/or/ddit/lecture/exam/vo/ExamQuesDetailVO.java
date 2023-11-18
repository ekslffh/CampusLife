package kr.or.ddit.lecture.exam.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "eqdQdNo", "eqdQuesNo", "eqdExamNo" })
public class ExamQuesDetailVO {
	@NotBlank
	private Integer eqdQdNo;
	@NotBlank
	private Integer eqdQuesNo;
	@NotBlank
	private String eqdExamNo;
	@NotBlank
	private String eqdContent;
}
