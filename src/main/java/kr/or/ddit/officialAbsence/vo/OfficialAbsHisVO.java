package kr.or.ddit.officialAbsence.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "oahId")
public class OfficialAbsHisVO {
	@NotBlank
	private String oahId;
	private String oahFile;
	@NotBlank
	private LocalDate oahRegDt;
	@NotBlank
	private String oahStdNo;
	@NotBlank
	private String oahLsNo;
	@NotBlank
	private String oahOacId;
}
