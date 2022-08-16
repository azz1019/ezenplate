package com.ezenplate.www.domain;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardVO {
	private long bno;
	private String userLocate;
	private String bname;
	private String content;
	private Date regAt;
	private String modAt;
	private String writer;
	private int readCount;
	private int cmtQty;
	private int fileCount;
}