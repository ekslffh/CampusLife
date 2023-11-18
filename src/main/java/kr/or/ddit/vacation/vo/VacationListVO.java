package kr.or.ddit.vacation.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "vlId")
public class VacationListVO {
	@NotBlank
	private String vlId;
	@NotBlank
	private String vlReqType;
	@NotBlank
	private String vlReqId;
	@NotBlank
	private LocalDate vlStartDt;
	@NotBlank
	private LocalDate vlEndDt;
	@NotBlank
	private Integer vlVacDay;
	@NotBlank
	private LocalDate vlReqDt;
	private String vlRsn;
	@NotBlank
	private String vlStatus;
	private String vlAppCon;
	@NotBlank
	private String vlVtId;
}
