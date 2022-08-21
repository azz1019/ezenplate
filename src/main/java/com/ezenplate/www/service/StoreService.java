package com.ezenplate.www.service;

import com.ezenplate.www.domain.StoreDTO;
import com.ezenplate.www.domain.StoreVO;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;

public interface StoreService {
	public int register(StoreDTO sdto); // 식당 등록
	public List<StoreVO> getList(PagingVO pgvo); // 식당 목록
	public List<StoreVO> getMyList(PagingVO pgvo, String email); // 내가 등록한 식당 목록
	public StoreDTO getDetail(long sno); // 식당 상세
	public int remove(long sno); // 식당 삭제
	public int getTotalCount(PagingVO pgvo); // 전체 식당 갯수 반환
	public int getMyTotalCount(PagingVO pgvo, String email); // 내가 등록한 식당 전체 갯수 반환
	public int removeFile(String uuid); // 파일 삭제
	public int admit(StoreVO svo);
	
	/* 맛집 목록 및 검색*/
	List<StoreDTO> store_list(PagingVO pgvo); // 맛집 전체 목록
	List<StoreDTO> search_store_list(PagingVO pgvo); // 맛집 검색 목록
	int getTotal_Count(PagingVO pgvo); // 전체 맛집 수
	int get_search_all_Count(PagingVO pgvo); // 전체 맛집 수
	int get_search_count(PagingVO pgvo); // 검색한 맛집 수
	StoreDTO get_store(long sno, int i); // 맛집 detail
	List<StoreDTO> view_more(); // 
	public List<StoreVO> getApproveList(PagingVO pgvo); // approve 0인 식당 목록
	int getTotalApproveCount(PagingVO pgvo); // approve 0인 맛집 수
}
