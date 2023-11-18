package kr.or.ddit.dormitory.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "rsId")
public class DMRppStandardVO {
	@NotBlank
	private String rsId;
	@NotBlank
	private String rsType;
	@NotBlank
	private String rsNm;
	private String rsContent;
	@NotBlank
	private Integer rsPoint;
}
