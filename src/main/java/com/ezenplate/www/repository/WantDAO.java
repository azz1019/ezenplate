package com.ezenplate.www.repository;

import java.util.List;
import java.util.Map;

import com.ezenplate.www.domain.WantVO;

public interface WantDAO {
	List<WantVO> selectList(Map map); // 가고싶다 목록
	int remove(Map map); // 가고싶다 삭제
	int selectTotalCount(Map map); // 가고싶다 갯수 반환
	int removeAllList(long mno); // 탈퇴시 가고싶다 목록 삭제
	int check_dul(WantVO wvo); // 중복확인
	int insert_want(WantVO wvo); // 가고싶다 추가
	List<WantVO> want_get_list(long mno); // 회원 가고싶다 리스트 가져
}
