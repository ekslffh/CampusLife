package kr.or.ddit.lecture.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "lrecStdNo", "lrecLecNo" })
public class LectureRecordVO {
	@NotBlank
	private String lrecStdNo;
	@NotBlank
	private String lrecLecNo;
	@NotBlank
	private String lrecGrades;
	@NotBlank
	private Integer lrecRank;
}
