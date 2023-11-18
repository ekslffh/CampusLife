package kr.or.ddit.leaveReturn.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "larhId")
public class LeaveReturnHistoryVO {
	@NotBlank
	private String larhId;
	@NotBlank
	private String larhType;
	@NotBlank
	private LocalDate larhReqDt;
	@NotBlank
	private String larhReqRes;
	@NotBlank
	private String larhStatus;
	private String larhResCont;
	private String larhLoaiId;
	@NotBlank
	private String larhStdNo;
}
