package kr.or.ddit.graduate.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "gdId")
public class GraduateVO {
	@NotBlank
	private String gdId;
	@NotBlank
	private String gdYear;
	@NotBlank
	private Integer gdVoltime;
	@NotBlank
	private String gdTotalgrade;
}
