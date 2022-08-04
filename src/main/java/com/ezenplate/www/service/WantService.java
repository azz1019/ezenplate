package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.WantVO;

public interface WantService {
	public List<WantVO> getList(PagingVO pgvo); // 가고싶다 목록
	public int remove(long sno); // 가고싶다 삭제
	public int getTotalCount(PagingVO pgvo); // 전체 가고싶다 갯수 반환
}
