package kr.or.ddit.student.vo;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "stdNo")
public class StudentVO implements Serializable {
	
	private String stdNo;
	@NotBlank
	private String stdNm;
	@NotBlank
	private String stdTel;
	@NotBlank
	private String stdAddr;
	@NotBlank
	private String stdGender;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate stdBir;
	@NotBlank
	private String stdEmail;
	@NotBlank
	private String stdCountry;
	private String stdStatus;
	private String stdProfile;
	private Integer stdFinCredit;
	@NotBlank
	private String stdMajCd;
	private String stdProfNo;
//	@NotBlank
	@JsonIgnore // 보안을 위해 Json 변환시(직렬화과정)에 포함되지 않도록 설정
	private String stdPw;
	@NotBlank 
	private String stdDetailAddr;
	@NotBlank 
	private String stdPostNo;
}
