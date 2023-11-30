package kr.or.ddit.classRegi.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "crNo")
public class ClassRegiVO {
	@NotBlank
	private Integer crNo;
	@NotBlank
	private Integer crYear;
	@NotBlank
	private Integer crSem;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @NotBlank
    private LocalDateTime crPreStartTm;
    
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @NotBlank
    private LocalDateTime crPreEndTm;
    
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @NotBlank
    private LocalDateTime crStartTm;
    
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @NotBlank
    private LocalDateTime crEndTm;
	@NotBlank
	private String crEndSemSr;
}
