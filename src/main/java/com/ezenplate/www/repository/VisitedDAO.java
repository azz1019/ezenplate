package com.ezenplate.www.repository;

import java.util.List;
import java.util.Map;

import com.ezenplate.www.domain.VisitedVO;

public interface VisitedDAO {
	List<VisitedVO> selectList(Map map); // 가봤어요 목록
	int remove(Map map); // 가봤어요 삭제
	int selectTotalCount(Map map); // 가봤어요 갯수 반환
}
