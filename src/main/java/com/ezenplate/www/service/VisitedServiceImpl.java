package com.ezenplate.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<VisitedVO> getList(PagingVO pgvo, long mno) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("mno", mno);
		
		return vdao.selectList(map);
	}

	@Override
	public int remove(long sno, long mno) {
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("mno", mno);
		
		return vdao.remove(map);
	}

	@Override
	public int getTotalCount(PagingVO pgvo, long mno) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("mno", mno);
		
		return vdao.selectTotalCount(map);
	}
}
