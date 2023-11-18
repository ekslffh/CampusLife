package kr.or.ddit.calendar.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "calId")
public class CalendarVO {
	@NotBlank
	private String calId;
	@NotBlank
	private String calTitle;
	@NotBlank
	private String calContent;
	@NotBlank
	private LocalDate calStartDt;
	@NotBlank
	private LocalDate calEndDt;
}
