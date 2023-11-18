package kr.or.ddit.lecture.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "lrsLecNo")
public class LectureRecordStandVO {
	@NotBlank
	private String lrsLecNo;
	@NotBlank
	private Integer lrsAtt;
	@NotBlank
	private Integer lrsMid;
	@NotBlank
	private Integer lrsFin;
	@NotBlank
	private Integer lrsSub;
	@NotBlank
	private Integer lrsA;
	@NotBlank
	private Integer lrsB;
	@NotBlank
	private Integer lrsC;
	@NotBlank
	private Integer lrsD;
}
