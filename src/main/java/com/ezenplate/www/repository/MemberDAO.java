package com.ezenplate.www.repository;

import com.ezenplate.www.domain.MemberVO;

public interface MemberDAO {
	MemberVO selectOne(MemberVO mvo); // 로그인
}
