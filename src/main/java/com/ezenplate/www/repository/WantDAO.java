package com.ezenplate.www.repository;

import java.util.List;
import java.util.Map;

import com.ezenplate.www.domain.WantVO;

public interface WantDAO {
	List<WantVO> selectList(Map map); // 가고싶다 목록
	int remove(Map map); // 가고싶다 삭제
	int selectTotalCount(Map map); // 가고싶다 갯수 반환
}
