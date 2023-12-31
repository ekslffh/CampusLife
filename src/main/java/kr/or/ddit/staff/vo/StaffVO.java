package kr.or.ddit.staff.vo;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "stfNo")
public class StaffVO implements Serializable {
	
	private String stfNo;
	@NotBlank
	private String stfNm;
	@NotBlank
	private String stfGender;
	private String stfProfile;
	@NotBlank
	private String stfCountry;
	@NotBlank
	private String stfAddr;
	@NotBlank
	private String stfTel;
	@NotBlank
	private String stfEmail;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate stfJoinDt;
	
	private String stfStatus;
	@NotBlank
	private String stfDeptNo;
//	@NotBlank
	@JsonIgnore
	private String stfPw;
	@NotBlank 
	private String stfDetailAddr;
	@NotBlank 
	private String stfPostNo;
	
}
