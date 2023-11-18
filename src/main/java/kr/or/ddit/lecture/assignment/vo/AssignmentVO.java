package kr.or.ddit.lecture.assignment.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "asNo")
public class AssignmentVO {
	@NotBlank
	private String asNo;
	@NotBlank
	private LocalDate asRegTm;
	@NotBlank
	private LocalDate asStartTm;
	private LocalDate asEndTm;
	@NotBlank
	private String asTitle;
	private String asContent;
	private String asFile;
	@NotBlank
	private String asLecNo;
}
