package kr.or.ddit.consulting.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "consId")
public class ConsultingVO {
	@NotBlank
	private String consId;
	@NotBlank
	private String consTitle;
	@NotBlank
	private String consContent;
	@NotBlank
	private String consType;
	@NotBlank
	private LocalDate consDate;
	private String consAnswer;
	@NotBlank
	private String consState;
	private LocalDate consAnsDt;
	@NotBlank
	private String consProfNo;
	@NotBlank
	private String consStdNo;
}
