package kr.or.ddit.dormitory.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "dolId")
public class DMOutListVO {
	@NotBlank
	private String dolId;
	@NotBlank
	private LocalDate dolOutDt;
	private String dolRsn;
	@NotBlank
	private String dolDcId;
}
