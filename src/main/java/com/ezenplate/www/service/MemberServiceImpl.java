package com.ezenplate.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.MemberDTO;
import com.ezenplate.www.domain.MemberVO;
import com.ezenplate.www.repository.FileDAO;
import com.ezenplate.www.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO mdao;
	
	@Inject
	private FileDAO fdao;
	
	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.selectOne(mvo);
	}

	@Override
	public int register(MemberDTO mdto) {
		int isUp = mdao.insert(mdto.getMvo());
		if((isUp > 0) && (mdto.getFvo() != null)) {
			long mno = mdao.selectLastMno();
			mdto.getFvo().setMno(mno);
			isUp = fdao.insertMemberFile(mdto.getFvo());
		}
		return isUp;
	}

	@Override
	public int dupleCheck(String email) {
		return mdao.selectEmail(email);
	}

	@Override
	public MemberDTO getDetail(String email) {
		long mno = mdao.selectMnoMatchEmail(email);
		return new MemberDTO(mdao.selectDetail(email), fdao.selectMemberListFile(mno));
	}

	@Override
	public int removeFile(String uuid) {
		return fdao.deleteFile(uuid);
	}

	@Override
	public int modify(MemberDTO mdto) {
		int isUp = mdao.update(mdto.getMvo());
		if((isUp > 0) && (mdto.getFvo() != null)) {
			long mno = mdao.selectMnoMatchEmail(mdto.getMvo().getEmail());
			mdto.getFvo().setMno(mno);
			isUp = fdao.insertMemberFile(mdto.getFvo());
		}
		return isUp;
	}

	@Override
	public int remove(String email) {
		long mno = mdao.selectMnoMatchEmail(email);
		fdao.deleteMemberFile(mno);
		int isUp = mdao.delete(email);
		return isUp;
	}

	@Override
	public List<MemberVO> getList() {
		return mdao.selectList();
	}
}
