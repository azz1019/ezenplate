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
public class CommentDTO {
	private CommentVO cvo;
	private List<FileVO> fileList;
}
