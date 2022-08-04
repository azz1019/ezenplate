package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.VisitedVO;

public interface VisitedService {
	public List<VisitedVO> getList(PagingVO pgvo, long mno); // 가봤어요 목록
	public int remove(long sno, long mno); // 가봤어요 삭제
	public int getTotalCount(PagingVO pgvo, long mno); // 가봤어요 갯수 반환
}
