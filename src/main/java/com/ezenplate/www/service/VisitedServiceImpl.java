package com.ezenplate.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.VisitedVO;
import com.ezenplate.www.repository.StoreDAO;
import com.ezenplate.www.repository.VisitedDAO;

@Service
public class VisitedServiceImpl implements VisitedService {
	@Inject
	private VisitedDAO vdao;
	@Inject
	private StoreDAO sdao;
	
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

	@Override
	public int register(long mno, long sno) {
		String sname = sdao.select_store_name(sno);
		int ok = vdao.register(mno, sno, sname);
		if(ok > 0){
			return ok;
		}
		return 0;
	}

	@Override
	public int check(long mno, long sno) {
		VisitedVO vvo = new VisitedVO();
		vvo.setMno(mno);
		vvo.setSno(sno);
		int ok = vdao.check(vvo);
		if(ok==0) {
			return 1;
		} else {
			return 0;			
		}
		
	}
	@Override
	public List<VisitedVO> visit_list(long mno) {
		
		return vdao.get_list(mno);
	}
}
