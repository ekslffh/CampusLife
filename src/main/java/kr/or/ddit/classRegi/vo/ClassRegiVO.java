package kr.or.ddit.classRegi.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "crNo")
public class ClassRegiVO {
	@NotBlank
	private Integer crNo;
	@NotBlank
	private Integer crYear;
	@NotBlank
	private Integer crSem;
	@NotBlank
	private LocalDate crPreStartTm;
	@NotBlank
	private LocalDate crPreEndTm;
	@NotBlank
	private LocalDate crStartTm;
	@NotBlank
	private LocalDate crEndTm;
	@NotBlank
	private String crEndSemSr;
}
