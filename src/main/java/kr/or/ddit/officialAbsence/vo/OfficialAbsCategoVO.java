package kr.or.ddit.officialAbsence.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "oacId")
public class OfficialAbsCategoVO {
	@NotBlank
	private String oacId;
	@NotBlank
	private String oacNm;
	private String oacDetail;
	@NotBlank
	private String oacUnitStnd;
	@NotBlank
	private Integer oacCnt;
}
