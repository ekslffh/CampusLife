package kr.or.ddit.classRegi.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "crrCrNo", "crrStdNo" })
public class ClassRegiRecordVO {
	@NotBlank
	private Integer crrCrNo;
	@NotBlank
	private String crrStdNo;
	@NotBlank
	private Integer crrGrades;
	@NotBlank
	private Integer crrRank;
	@NotBlank
	private Integer crrRatingAvg;
	@NotBlank
	private Integer crrAvgScore;
}
