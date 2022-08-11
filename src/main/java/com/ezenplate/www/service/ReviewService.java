package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewDTO;
import com.ezenplate.www.domain.ReviewVO;

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
	public int removeFile(String uuid); // 파일 삭제
}
