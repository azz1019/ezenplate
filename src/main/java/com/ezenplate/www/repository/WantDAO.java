package com.ezenplate.www.repository;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.WantVO;

public interface WantDAO {
	List<WantVO> selectList(PagingVO pgvo); // 가고싶다 목록
	int remove(long sno); // 가고싶다 삭제
	int selectTotalCount(PagingVO pgvo); // 전체 가고싶다 갯수 반환
}
