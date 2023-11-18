package kr.or.ddit.lecture.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "ldCnt", "ldLecNo" })
public class LectureDetailVO {
	@NotBlank
	private Integer ldCnt;
	@NotBlank
	private String ldLecNo;
	@NotBlank
	private Integer ldStartHour;
	@NotBlank
	private Integer ldEndHour;
	@NotBlank
	private Integer ldDay;
}
