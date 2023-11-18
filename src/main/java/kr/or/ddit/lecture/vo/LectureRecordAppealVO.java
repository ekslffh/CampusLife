package kr.or.ddit.lecture.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "lraLecNo", "lraStdNo" })
public class LectureRecordAppealVO {
	@NotBlank
	private String lraLecNo;
	@NotBlank
	private String lraStdNo;
	@NotBlank
	private String lraContent;
	private String lraAnswer;
	@NotBlank
	private LocalDate lraReqTm;
	private LocalDate lraAnsTm;
}
