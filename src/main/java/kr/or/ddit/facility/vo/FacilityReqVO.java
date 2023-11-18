package kr.or.ddit.facility.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "frReqNo")
public class FacilityReqVO {
	@NotBlank
	private String frReqNo;
	@NotBlank
	private String frReqType;
	@NotBlank
	private String frReqId;
	@NotBlank
	private LocalDate frStartDt;
	@NotBlank
	private LocalDate frEndDt;
	@NotBlank
	private String frReqRes;
	@NotBlank
	private LocalDate frReqStartDt;
	private String frAppSr;
	private String frResCont;
	@NotBlank
	private String frFacNo;
}
