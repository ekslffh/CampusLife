package kr.or.ddit.message.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "mesSendId")
public class MesSendVO {
	@NotBlank
	private String mesSendId;
	@NotBlank
	private String mesSendTitle;
	@NotBlank
	private String mesSendContent;
	@NotBlank
	private String mesSendSendtype;
	@NotBlank
	private String mesSendSendid;
	@NotBlank
	private String mesSendRectype;
	@NotBlank
	private String mesSendRecid;
	@NotBlank
	private LocalDate mesSendDt;
	@NotBlank
	private String mesSendDel;
}
