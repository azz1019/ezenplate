package com.ezenplate.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.CommentVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.repository.BoardDAO;
import com.ezenplate.www.repository.CommentDAO;


@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDAO cdao;
	@Inject
	private BoardDAO bdao;
	
	public CommentServiceImpl() {}
	
	@Override
	public int post(CommentVO cvo) {
		int isUp = cdao.insert(cvo);
		if(isUp > 0) {
			isUp = bdao.updateCmtQty(cvo.getBno(), 1);
		}
		return isUp;
	}

	@Override
	public PagingHandler spread(long bno, PagingVO pgvo) {
		return new PagingHandler(pgvo, cdao.selectTotalCount(bno));
	}

	@Override
	public int modify(CommentVO cvo) {
		return 0;
	}

	@Override
	public int remove(long cno) {
		return 0;
	}

}
