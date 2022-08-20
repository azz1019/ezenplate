package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.BoardDTO;
import com.ezenplate.www.domain.BoardVO;
import com.ezenplate.www.domain.CommentDTO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewDTO;

public interface BoardService {
	int register(BoardDTO bdto); // register
	BoardDTO getDetail(long bno); // detail
	int modify(BoardDTO bdto); // modify
	int remove(long bno); // remove
	int getTotalCount(PagingVO pgvo);
	int getMyTotalCount(PagingVO pgvo, String nickName);
	int removeFile(String uuid);
	
	List<BoardDTO> getList(PagingVO pgvo);//list 
	List<BoardDTO> getMyList(PagingVO pgvo, String nickName);
}
