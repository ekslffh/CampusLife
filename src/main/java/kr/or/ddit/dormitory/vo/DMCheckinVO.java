package kr.or.ddit.dormitory.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "dcId")
public class DMCheckinVO {
	@NotBlank
	private String dcId;
	@NotBlank
	private String dcStatus;
	@NotBlank
	private LocalDate dcStaDt;
	@NotBlank
	private String dcStdNo;
	@NotBlank
	private String dcDmRnum;
	@NotBlank
	private String dcAreaNo;
}
