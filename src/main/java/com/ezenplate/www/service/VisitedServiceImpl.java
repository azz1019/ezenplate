package com.ezenplate.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.VisitedVO;
import com.ezenplate.www.repository.VisitedDAO;

@Service
public class VisitedServiceImpl implements VisitedService {
	@Inject
	private VisitedDAO vdao;
	
	@Override
	public List<VisitedVO> getList(PagingVO pgvo) {
		return vdao.selectList(pgvo);
	}

	@Override
	public int remove(long sno) {
		return vdao.remove(sno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return vdao.selectTotalCount(pgvo);
	}
}
