package kr.or.ddit.dormitory.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "drsId")
public class DMRppStatusVO {
	@NotBlank
	private String drsId;
	@NotBlank
	private LocalDate drsRsDt;
	private String drsRsn;
	@NotBlank
	private String drsRsId;
	@NotBlank
	private String dlsDcId;
}
