package kr.or.ddit.message.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "mesRecId")
public class MesRecVO {
	@NotBlank
	private String mesRecId;
	@NotBlank
	private String mesRecTitle;
	@NotBlank
	private String mesRecContent;
	@NotBlank
	private String mesRecSendtype;
	@NotBlank
	private String mesRecSendid;
	@NotBlank
	private String mesRecRectype;
	@NotBlank
	private String mesRecRecid;
	@NotBlank
	private LocalDate mesRecDate;
	@NotBlank
	private String mesRecDel;
}
