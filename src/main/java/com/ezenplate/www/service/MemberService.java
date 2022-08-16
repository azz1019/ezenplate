package com.ezenplate.www.service;

import java.util.List;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.MemberDTO;
import com.ezenplate.www.domain.MemberVO;
import com.ezenplate.www.domain.PagingVO;

public interface MemberService {
	public MemberVO login(MemberVO mvo); // 로그인
	public int register(MemberDTO mdto); // 회원가입
	public int dupleCheck(String email); // 이메일 중복검사
	public MemberDTO getDetail(String email); // 상세 정보 반환
	public int removeFile(String uuid); // 파일 삭제
	public int modify(MemberDTO mdto); // 프로필 수정
	public int remove(String email); // 탈퇴
	public List<MemberVO> getList(); // 리스트
	public int gradeChange(MemberVO mvo);
	public int lastLogin(String email);
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
	public List<FileVO> getListFile();// 프로필 파일 전체 리스트
>>>>>>> Stashed changes
=======
	public List<FileVO> getListFile();// 프로필 파일 전체 리스트
	public List<MemberVO> getListHolic(); // holic순
>>>>>>> d323d31ec800f3b50d0c2a87e7f3faa685e316f2
}
