package com.ezenplate.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.WantVO;
import com.ezenplate.www.repository.WantDAO;

@Service
public class WantServiceImpl implements WantService {
	@Inject
	private WantDAO wdao;

	@Override
	public List<WantVO> getList(PagingVO pgvo) {
		return wdao.selectList(pgvo);
	}

	@Override
	public int remove(long sno) {
		return wdao.remove(sno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return wdao.selectTotalCount(pgvo);
	}
}
