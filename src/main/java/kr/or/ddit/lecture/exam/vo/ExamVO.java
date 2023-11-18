package kr.or.ddit.lecture.exam.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "examNo")
public class ExamVO {
	@NotBlank
	private String examNo;
	@NotBlank
	private String examDiv;
	@NotBlank
	private LocalDate examStartTm;
	@NotBlank
	private LocalDate examEndTm;
	@NotBlank
	private Integer examNumber;
	@NotBlank
	private String examLecNo;
}
