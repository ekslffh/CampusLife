package kr.or.ddit.lecture.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "clrNo")
public class ClassRoomVO {
	@NotBlank
	private Integer clrNo;
	@NotBlank
	private String clrAreaNo;
}
