package kr.or.ddit.lecture.subject.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class SubjectDTO {
	@NotBlank
	private String subNo;
	@NotBlank
	private String subNm;
	@NotBlank
	private String subStatus;
	@NotBlank
	private String subType;

	private String subMajCd;

	private String subRequired;
	
	@NotBlank
	private Integer seGrade;

}
