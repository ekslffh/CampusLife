package kr.or.ddit.lecture.subject.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "seSubNo", "seMajCd" })
public class SubjectEssentialVO {
	@NotBlank
	private String seSubNo;
	@NotBlank
	private String seMajCd;
	@NotBlank
	private Integer seGrade;
}
