package kr.or.ddit.lecture.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "lecNo")
public class LectureVO {
	@NotBlank
	private String lecNo;
	@NotBlank
	private Integer lecGrades;
	@NotBlank
	private String lecConf;
	private String lecClsPlan;
	@NotBlank
	private String lecSubNo;
	@NotBlank
	private String lecProfNo;
	private Integer lecClrNo;
	@NotBlank
	private Integer lecCrNo;
}
