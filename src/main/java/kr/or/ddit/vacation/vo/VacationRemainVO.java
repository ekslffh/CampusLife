package kr.or.ddit.vacation.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "vrId")
public class VacationRemainVO {
	@NotBlank
	private String vrId;
	@NotBlank
	private String vrType;
	@NotBlank
	private String vrStfId;
	private Integer vrHaveAl;
	private Integer vrHaveSk;
	private Integer vrHavePd;
}
