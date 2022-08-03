package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewDTO;
import com.ezenplate.www.domain.ReviewVO;

public interface ReviewService {
	
	List<ReviewDTO> get_list(long sno, PagingVO pvo); // 리뷰 목록
	ReviewDTO get_review(long rno); // 리뷰 detail
	int register(ReviewDTO rdto); // 리뷰 생성
	void remove(long rno); // 리뷰 삭제
	int modify(ReviewDTO rdto); // 리뷰 수정
	void report(long rno); // 리뷰 신고
}
