package kr.or.ddit.lecture.subject.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "subNo")
public class SubjectVO {
	@NotBlank
	private String subNo;
	@NotBlank
	private String subNm;
	@NotBlank
	private String subStatus;
	@NotBlank
	private String subType;
	@NotBlank
	private String subMajCd;
}
