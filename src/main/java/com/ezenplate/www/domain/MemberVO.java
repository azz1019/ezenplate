package com.ezenplate.www.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberVO {
	private long mno;
	private String email;
	private String pwd;
	private String nickName;
	private int grade;
	private long reviewCount;
	private String userLocate;
	private String lastLogin;
}
