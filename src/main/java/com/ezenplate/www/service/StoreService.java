package com.ezenplate.www.service;

import com.ezenplate.www.domain.StoreDTO;
import com.ezenplate.www.domain.StoreVO;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;

public interface StoreService {
	public int register(StoreDTO sdto); // 식당 등록
	public List<StoreVO> getList(PagingVO pgvo); // 식당 목록
	public StoreDTO getDetail(long sno); // 식당 상세
	public int remove(long sno); // 식당 삭제
	public int getTotalCount(PagingVO pgvo); // 전체 식당 갯수 반환
	public int removeFile(String uuid); // 파일 삭제
}
