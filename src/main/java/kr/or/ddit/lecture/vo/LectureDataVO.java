package kr.or.ddit.lecture.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "ldaId")
public class LectureDataVO {
	@NotBlank
	private String ldaId;
	@NotBlank
	private String ldaTitle;
	private String ldaContent;
	private String ldaFile;
	@NotBlank
	private LocalDate ldaRegTm;
	@NotBlank
	private String ldaLecNo;
}
