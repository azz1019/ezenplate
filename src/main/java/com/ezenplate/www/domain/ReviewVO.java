package com.ezenplate.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class ReviewVO {
	private long sno;
	private long rno;
	private float rate;
	private String regAt;
	private String modAt;
	private String content;
	private int report;
	private String writer;
	private String title;
}
