package com.ezenplate.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class ReviewDTO {
	private ReviewVO rvo;
	private List<FileVO> fileList;
}
