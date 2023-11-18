package kr.or.ddit.dormitory.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "dmRnum", "dmAreaNo" })
public class DormitoryVO {
	@NotBlank
	private String dmRnum;
	@NotBlank
	private String dmAreaNo;
	@NotBlank
	private Integer dmCapacity;
	@NotBlank
	private Integer cmCpStatus;
}
