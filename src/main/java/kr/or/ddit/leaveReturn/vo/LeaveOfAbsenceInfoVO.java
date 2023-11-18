package kr.or.ddit.leaveReturn.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "loaiId")
public class LeaveOfAbsenceInfoVO {
	@NotBlank
	private String loaiId;
	@NotBlank
	private String loaiNm;
	@NotBlank
	private Integer loaiCnt;
	@NotBlank
	private String loaiDetail;
}
