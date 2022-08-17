package com.ezenplate.www.service;


import com.ezenplate.www.domain.CommentVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.handler.PagingHandler;

public interface CommentService {
	int post(CommentVO cvo); // post(register)
	PagingHandler spread(long bno, PagingVO pgvo);  //list
	int modify(CommentVO cvo); // modify
	int remove(long cno); // remove
	
	
}
