package com.ezenplate.www.repository;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.StoreVO;

public interface StoreDAO {
	int insert(StoreVO svo); // 식당 등록
	List<StoreVO> selectList(PagingVO pgvo); // 식당 목록
	StoreVO selectOne(long sno); // 식당 상세
	int remove(long sno); // 식당 삭제
	int selectTotalCount(PagingVO pgvo); // 전체 식당 갯수 반환
	long selectLastSno(); // 가장 최근등록한 식당의 sno 반환
	
	/* 맛집 목록 및 검색*/
	List<StoreVO> select_store_list(PagingVO pgvo); // 전체 맛집 목록
	List<StoreVO> select_search_store(PagingVO pgvo); // 검색한 맛집
	int select_total_count(PagingVO pgvo); // 맛집 전체 수
	int select_search_count(PagingVO pgvo); // 검색한 맛집 수
	void update_readcount(long sno, int i); // 맛집 조회수 증가
	StoreVO select_one(long sno); // 맛집 detail
}
