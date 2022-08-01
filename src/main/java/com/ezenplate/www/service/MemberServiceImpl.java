package com.ezenplate.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.MemberVO;
import com.ezenplate.www.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO mdao;
	
	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.selectOne(mvo);
	}
}
