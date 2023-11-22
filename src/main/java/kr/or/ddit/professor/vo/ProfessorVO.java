package kr.or.ddit.professor.vo;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "profNo")
public class ProfessorVO implements Serializable {
	@NotBlank
	private String profNo;
	@NotBlank
	private String profNm;
	@NotBlank
	private String profGender;
	private String profProfile;
	@NotBlank
	private String profCountry;
	@NotBlank
	private String profAddr;
	@NotBlank
	private String profTel;
	@NotBlank
	private String profEmail;
	@NotBlank
	private LocalDate profJoinDt;
	@NotBlank
	private String profStatus;
	@NotBlank
	private String profMajCd;
	@NotBlank
	@JsonIgnore
	private String profPw;
	@NotBlank 
	private String profDetailAddr;
	@NotBlank 
	private String profPostNo;
}
