package com.ezenplate.www.repository;

import java.util.List;

import com.ezenplate.www.domain.MemberVO;

public interface MemberDAO {
	MemberVO selectOne(MemberVO mvo); // 로그인
	int insert(MemberVO mvo); // 회원가입
	int selectEmail(String email); // 이메일 중복검사
	long selectLastMno(); // 가장 최근가입한 사용자의 mno 반환
	long selectMnoMatchEmail(String email); // 이메일 정보를 가지고있는 사용자의 mno 반환
	MemberVO selectDetail(String email); // 상세 정보 반환
	int update(MemberVO mvo); // 프로필 수정
	int delete(String email); // 탈퇴
	List<MemberVO> selectList(); // 리스트
}
