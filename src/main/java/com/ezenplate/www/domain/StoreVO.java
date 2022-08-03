package com.ezenplate.www.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class StoreVO {
	private long sno;
	private String writer;
	private String sname;
	private String category;
	private String locate;
	private String tel;
	private String content;
	private String menuName1;
	private String menuName2;
	private String menuName3;
	private String menuName4;
	private String menuName5;
	private int menuPrice1;
	private int menuPrice2;
	private int menuPrice3;
	private int menuPrice4;
	private int menuPrice5;
	private String holiday;
	private float rateAvg;
	private int approve;
	private int readCount;
	private int cmtQty;
	private String regAt;
	private String modAt;
	private int likes;
}
