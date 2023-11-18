package kr.or.ddit.lecture.assignment.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "asubAsNo", "asubStdNo" })
public class AssignmentSubVO {
	@NotBlank
	private String asubAsNo;
	@NotBlank
	private String asubStdNo;
	@NotBlank
	private String asubFile;
	@NotBlank
	private LocalDate asubCrtTm;
	private LocalDate asubUpdTm;
	@NotBlank
	private Integer asubScore;
}
