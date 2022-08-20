package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewDTO;
import com.ezenplate.www.domain.ReviewVO;
import com.ezenplate.www.handler.PagingHandler;

public interface ReviewService {
	List<ReviewDTO> get_list(long sno); // 리뷰 목록
	ReviewDTO get_review(long rno); // 리뷰 detail
	void report(long rno); // 리뷰 신고
	
	public int register(ReviewDTO rdto); // 리뷰 등록
	public List<ReviewVO> getList(PagingVO pgvo); // 리뷰 목록
	public ReviewDTO getDetail(long rno); // 리뷰 상세
	public int modify(ReviewDTO rdto); // 리뷰 수정
	public int remove(long rno); // 리뷰 삭제
	public int getTotalCount(PagingVO pgvo); // 전체 리뷰 갯수 반환
	int getMyTotalCount(PagingVO pgvo, String email); // 내가 쓴 리뷰 전체 갯수 반환
	public List<ReviewVO> getMyList(PagingVO pgvo, String email); // 내가 쓴 리뷰 전체 목록 반환
	public int removeFile(String uuid); // 파일 삭제
	
	public List<ReviewVO> getlistall(); // 리뷰 전체 리스트
	public List<ReviewVO> getListGood(); // good 순 리스트
	public List<ReviewVO> getListbad(); // bad 순 리스트
	int getHolicTotalCount(PagingVO pgvo); // holic 총 갯수
	int getGoodTotalCount(PagingVO pgvo); // good 총 갯수
	int getbadTotalCount(PagingVO pgvo); // bad 총 갯수
	int cancel(ReviewVO rvo);
}
