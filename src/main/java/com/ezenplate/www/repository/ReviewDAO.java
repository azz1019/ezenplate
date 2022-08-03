package com.ezenplate.www.repository;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewVO;

public interface ReviewDAO {
	int insert_review(ReviewVO rvo); // 리뷰 등록
	List<ReviewVO> review_list(long sno, PagingVO pgvo); // 리뷰 리스트
	ReviewVO get_review(long rno); // 리뷰 detail
	long select_last_rno(); // 리뷰 마지막 번호
	int delete_review(long rno); // 리뷰 삭제
	int update(ReviewVO rvo); // 리뷰 수정
	void update_report(long rno); // 리뷰 신고
}
