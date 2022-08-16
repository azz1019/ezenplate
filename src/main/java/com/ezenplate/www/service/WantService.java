package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.WantVO;

public interface WantService {
	public List<WantVO> getList(PagingVO pgvo, long mno); // 가고싶다 목록
	public int remove(long sno, long mno); // 가고싶다 삭제
	public int getTotalCount(PagingVO pgvo, long mno); // 가고싶다 갯수 반환
	public int check(long sno, long mno); // 중복확인
	public int register(long sno, long mno); // 가고싶다 생성
	public List<WantVO> want_list(long mno); // 회원 가고싶다 리스트 가져오기
}
