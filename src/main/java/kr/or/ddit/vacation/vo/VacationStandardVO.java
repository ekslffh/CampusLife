package kr.or.ddit.vacation.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "vsId")
public class VacationStandardVO {
	@NotBlank
	private String vsId;
	@NotBlank
	private Integer vsAlDay;
	@NotBlank
	private Integer vsAddVac;
}
