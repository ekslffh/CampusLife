package kr.or.ddit.lecture.exam.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "eqtQuesNo", "eqtExamNo", "eqtStdNo" })
public class ExamQuesTakeVO {
	@NotBlank
	private Integer eqtQuesNo;
	@NotBlank
	private String eqtExamNo;
	@NotBlank
	private String eqtStdNo;
	private String eqtAnswer;
	private String eqtResult;
}
