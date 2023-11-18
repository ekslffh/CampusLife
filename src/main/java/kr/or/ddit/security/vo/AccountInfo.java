package kr.or.ddit.security.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountInfo {
	private String id;
	private String pw;
	private String type;
	private String auth;
}
