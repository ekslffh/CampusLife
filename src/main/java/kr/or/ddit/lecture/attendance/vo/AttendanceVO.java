package kr.or.ddit.lecture.attendance.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "attStdNo", "attLsNo" })
public class AttendanceVO {
	@NotBlank
	private String attStdNo;
	@NotBlank
	private String attLsNo;
	@NotBlank
	private String attStatus;
}
