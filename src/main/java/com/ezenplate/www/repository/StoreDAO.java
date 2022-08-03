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
}
