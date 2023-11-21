package kr.or.ddit.officialAbsence.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "oahId")
public class OfficialAbsHisVO {
	
	private String oahId;
	
	private String oahFile;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate oahRegDt;
	
	@NotBlank
	private String oahStdNo;
	
	@NotBlank
	private String oahLsNo;
	
	@NotBlank
	private String oahOacId;
	
}
