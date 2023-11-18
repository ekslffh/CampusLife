package kr.or.ddit.scholarship.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "schId")
public class ScholarshipVO {
	@NotBlank
	private String schId;
	@NotBlank
	private LocalDate schPayDt;
	@NotBlank
	private String schType;
	@NotBlank
	private LocalDate schApllyDate;
	@NotBlank
	private String schStdNo;
	@NotBlank
	private String schInfoId;
}
