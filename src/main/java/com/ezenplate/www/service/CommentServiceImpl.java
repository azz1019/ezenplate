package com.ezenplate.www.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezenplate.www.domain.CommentVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.repository.BoardDAO;
import com.ezenplate.www.repository.CommentDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDAO cdao;
	@Inject
	private BoardDAO bdao;

	public CommentServiceImpl() {
	}

	@Override
	public int post(CommentVO cvo) {
		int isUp = cdao.insert(cvo);
		if (isUp > 0) {
			isUp = bdao.updateCmtQty(cvo.getBno(), 1);
		}
		return isUp;
	}

	@Override
	public PagingHandler spread(long bno, PagingVO pgvo) {
		return new PagingHandler(cdao.selectList(bno, pgvo), 
				pgvo, cdao.selectTotalCount(bno));
	}

	@Override
	public int modify(CommentVO cvo) {
		return cdao.update(cvo);
	}

	@Transactional
	@Override
	public int remove(long cno) {
		long bno = cdao.selectBno(cno);
		int isDown = cdao.delete(cno);
		if (isDown > 0) {
			isDown = bdao.updateCmtQty(bno, -1);
			log.info(">>> Comment remove -get : {}", isDown > 0 ? "OK" : "FAIL");
		}
		return isDown;
	}

}
