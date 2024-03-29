package com.ezenplate.www.handler;

import java.util.List;

import com.ezenplate.www.domain.CommentVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingHandler {
	private int startPage; // 현재 화면에서 보여줄 페이지네이션의 시작 인덱스 번호
	private int endPage; // 현재 화면에서 보여줄 페이지네이션의 끝 인덱스 번호
	private boolean prev, next; // 이전, 다음 버튼 존재 여부
	
	private int totalCount; // 총 게시글의 수
	private PagingVO pgvo; // 사용자가 입력하거나 전달되는 페이징 정보값을 갖고 있는 객체
	private List<CommentVO> cmtList;//comment 페이지 리스트 
	private List<ReviewVO> rvwList;
	
	public PagingHandler(PagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		this.endPage = (int)(Math.ceil(pgvo.getPageNo() / (pgvo.getQty() * 1.0))) * pgvo.getQty();
		this.startPage = this.endPage - 9;
		
		int realEndPage = (int)(Math.ceil((this.totalCount * 1.0) / pgvo.getQty()));
		
		if(realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
	}
	
	public PagingHandler(List<CommentVO> cmtList, PagingVO pgvo, int totalCount) {
		this(pgvo, totalCount);
		this.cmtList = cmtList;
	}
	
	public PagingHandler(List<ReviewVO> rvwList, int totalCount,PagingVO pgvo) {
		this(pgvo, totalCount);
		this.rvwList = rvwList;
	}
}
