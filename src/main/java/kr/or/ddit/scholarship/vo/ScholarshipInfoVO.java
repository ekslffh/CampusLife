package kr.or.ddit.scholarship.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "schInfoId")
public class ScholarshipInfoVO {
	@NotBlank
	private String schInfoId;
	@NotBlank
	private String schInfoName;
	private String schInfoContent;
	@NotBlank
	private String schInfoPerson;
	@NotBlank
	private String schInfoAmt;
	@NotBlank
	private String schInfoPay;
}
