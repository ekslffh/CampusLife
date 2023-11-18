package kr.or.ddit.security.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

@SuppressWarnings("serial")
public class AccountWrapper<T> extends User {
	private T realUser;
	private String accType;

	public AccountWrapper(AccountInfo account, T realUser) {
		super(
			account.getId(),
			account.getPw(),
			AuthorityUtils.createAuthorityList(account.getAuth())
		);
		this.realUser = realUser;
		this.accType = account.getType();
	}
	
	public T getRealUser() {
		return realUser;
	}
	
	public String getAccType() {
		return accType;
	}
}
