package kr.or.ddit.noticeBoard.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "nbNo")
public class NoticeBoardVO {
	@NotBlank
	private String nbNo;
	@NotBlank
	private LocalDate nbDate;
	@NotBlank
	private String nbTitle;
	@NotBlank
	private String nbContent;
	private LocalDate nbChangeDt;
	private String nbFile;
	@NotBlank
	private String nbCheck;
	private String nbImp;
	@NotBlank
	private String nbStfNo;
}
