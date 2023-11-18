package kr.or.ddit.classRegi.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "suLecNo", "suStdNo" })
public class SignUpVO {
	@NotBlank
	private String suLecNo;
	@NotBlank
	private String suStdNo;
}
