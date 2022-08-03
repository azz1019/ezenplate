package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.BoardDTO;
import com.ezenplate.www.domain.BoardVO;
import com.ezenplate.www.domain.PagingVO;

public interface BoardService {
	int register(BoardDTO bdto); // register
	List<BoardVO> getList(PagingVO pgvo); // list
	BoardDTO getDetail(long bno); // detail
	int modify(BoardDTO bdto); // modify
	int remove(long bno); // remove
	int getTotalCount(PagingVO pgvo);
	int removeFile(String uuid);
}
