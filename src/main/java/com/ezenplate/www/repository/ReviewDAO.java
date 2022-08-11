package com.ezenplate.www.repository;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewVO;

public interface ReviewDAO {
	int insert_review(ReviewVO rvo); // 리뷰 등록
	List<ReviewVO> review_list(long sno); // 리뷰 리스트
	ReviewVO get_review(long rno); // 리뷰 detail
	long select_last_rno(); // 리뷰 마지막 번호
	int delete_review(long rno); // 리뷰 삭제
	int update(ReviewVO rvo); // 리뷰 수정
	void update_report(long rno); // 리뷰 신고

	int insert(ReviewVO rvo); // 리뷰 등록
	List<ReviewVO> selectList(PagingVO pgvo); // 리뷰 목록
	ReviewVO selectOne(long rno); // 리뷰 상세
	int remove(long rno); // 리뷰 삭제
	int selectTotalCount(PagingVO pgvo); // 전체 리뷰 갯수 반환
	long selectLastRno(); // 가장 최근등록한 리뷰의 rno 반환
}
