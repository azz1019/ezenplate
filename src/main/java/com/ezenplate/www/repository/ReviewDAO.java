package com.ezenplate.www.repository;

import java.util.List;
import java.util.Map;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewVO;

public interface ReviewDAO {
	int insert_review(ReviewVO rvo); // 리뷰 등록
	List<ReviewVO> review_list(long sno); // 리뷰 리스트
	ReviewVO get_review(long rno); // 리뷰 detail
	long select_last_rno(); // 리뷰 마지막 번호
	int delete_review(long rno); // 리뷰 삭제
	void update_report(long rno); // 리뷰 신고
	long select_sno(long rno); // rno로 sno 반환
	
	int insert(ReviewVO rvo); // 리뷰 등록
	List<ReviewVO> selectList(PagingVO pgvo); // 리뷰 목록
	ReviewVO selectOne(long rno); // 리뷰 상세
	int update(ReviewVO rvo); // 리뷰 수정
	int remove(long rno); // 리뷰 삭제
	int selectTotalCount(PagingVO pgvo); // 전체 리뷰 갯수 반환
	int selectMyTotalCount(Map map); // 내가 쓴 리뷰 전체 갯수 반환
	List<ReviewVO> selectMyList(Map map); // 내가 쓴 리뷰 전체 목록 반환
	long selectLastRno(); // 가장 최근등록한 리뷰의 rno 반환
	
	List<ReviewVO> selectAll(); // 리뷰 전체 리스트
	List<ReviewVO> selectListGood(); // good 순 리스트
	List<ReviewVO> selectListBad(); // bad 순 리스트
	int selectgetHolicTotalCount(); // holic 총 갯수
	int selectGoodHolicTotalCount();// good 총 갯수
	int selectBadTotalCount(); // bad 총 갯수
	int reportcancel(ReviewVO rvo);
	void delete_store_review(long sno); // store 삭제하면서 review도 삭제
	List<Long> select_sno_rno(long sno); // sno로 rno 찾기
}
