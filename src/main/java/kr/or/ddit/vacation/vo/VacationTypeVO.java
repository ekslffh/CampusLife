package kr.or.ddit.vacation.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "vtId")
public class VacationTypeVO {
	@NotBlank
	private String vtId;
	@NotBlank
	private String vtType;
	@NotBlank
	private Integer vtVacDay;
}
