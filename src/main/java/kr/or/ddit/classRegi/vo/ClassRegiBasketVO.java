package kr.or.ddit.classRegi.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "crbLecNo", "crbStdNo" })
public class ClassRegiBasketVO {
	@NotBlank
	private String crbLecNo;
	@NotBlank
	private String crbStdNo;
}
