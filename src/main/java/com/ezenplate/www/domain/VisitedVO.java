package com.ezenplate.www.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class VisitedVO {
	private long mno;
	private long sno;
	private String sname;
	private String regAt;
}
