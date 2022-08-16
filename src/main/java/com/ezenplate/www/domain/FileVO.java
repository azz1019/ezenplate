package com.ezenplate.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileVO {
	private String uuid;
	private String saveDir;
	private String fileName;
	private int fileType;
	private long sno;
	private long rno;
	private long mno;
	private long bno;
	private long cno;
	private long fileSize;
	private String regAt;
}
