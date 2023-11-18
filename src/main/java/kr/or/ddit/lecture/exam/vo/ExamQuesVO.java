package kr.or.ddit.lecture.exam.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "eqNo", "eqExamNo" })
public class ExamQuesVO {
	@NotBlank
	private Integer eqNo;
	@NotBlank
	private String eqExamNo;
	@NotBlank
	private String eqType;
	@NotBlank
	private Integer eqPoint;
	@NotBlank
	private String eqAnswer;
	@NotBlank
	private String eqContent;
}
