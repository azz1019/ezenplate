package com.ezenplate.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<WantVO> getList(PagingVO pgvo, long mno) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("mno", mno);
		
		return wdao.selectList(map);
	}

	@Override
	public int remove(long sno, long mno) {
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("mno", mno);
		
		return wdao.remove(map);
	}
	
	@Override
	public int getTotalCount(PagingVO pgvo, long mno) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("mno", mno);
		
		return wdao.selectTotalCount(map);
	}
}
