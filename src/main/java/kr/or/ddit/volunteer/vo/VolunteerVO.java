package kr.or.ddit.volunteer.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "volId")
public class VolunteerVO {
	@NotBlank
	private String volId;
	@NotBlank
	private LocalDate volStDt;
	@NotBlank
	private LocalDate volEndDt;
	@NotBlank
	private Integer volTime;
	@NotBlank
	private String volPlace;
	@NotBlank
	private String volContent;
	private String volFile;
	@NotBlank
	private String volType;
	private String volAnswer;
	@NotBlank
	private String volStdNo;
}
