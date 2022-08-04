package com.ezenplate.www.repository;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.VisitedVO;

public interface VisitedDAO {
	List<VisitedVO> selectList(PagingVO pgvo); // 가봤어요 목록
	int remove(long sno); // 가봤어요 삭제
	int selectTotalCount(PagingVO pgvo); // 전체 가봤어요 갯수 반환
}
