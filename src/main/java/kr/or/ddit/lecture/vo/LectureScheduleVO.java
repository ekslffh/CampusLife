package kr.or.ddit.lecture.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "lsNo")
public class LectureScheduleVO {
	@NotBlank
	private String lsNo;
	@NotBlank
	private Integer lsWeek;
	@NotBlank
	private LocalDate lsDt;
	private LocalDate lsSubDt;
	@NotBlank
	private Integer lsLecCnt;
	@NotBlank
	private String lsLecNo;
}
