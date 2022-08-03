package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.MemberDTO;
import com.ezenplate.www.domain.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO mvo); // 로그인
	public int register(MemberDTO mdto); // 회원가입
	public int dupleCheck(String email); // 이메일 중복검사
	public MemberDTO getDetail(String email); // 상세 정보 반환
	public int removeFile(String uuid); // 파일 삭제
	public int modify(MemberDTO mdto); // 프로필 수정
	public int remove(String email); // 탈퇴
	public List<MemberVO> getList(); // 리스트
}
