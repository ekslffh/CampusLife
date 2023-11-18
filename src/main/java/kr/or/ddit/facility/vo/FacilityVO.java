package kr.or.ddit.facility.vo;


import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "facNo")
public class FacilityVO {
	@NotBlank
	private String facNo;
	@NotBlank
	private String facNm;
	@NotBlank
	private String areaNo;
}
