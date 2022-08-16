package com.ezenplate.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.WantVO;
import com.ezenplate.www.repository.StoreDAO;
import com.ezenplate.www.repository.WantDAO;

@Service
public class WantServiceImpl implements WantService {
	@Inject
	private WantDAO wdao;
	@Inject
	private StoreDAO sdao;
	
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

	@Override
	public int check(long sno, long mno) {
		WantVO wvo = new WantVO();
		wvo.setSno(sno);
		wvo.setMno(mno);
		int check= wdao.check_dul(wvo);
		if(check == 0) {
			return 1;
		} else {
			return 0;
		}
		
	}

	@Override
	public int register(long sno, long mno) {
		String sname = sdao.select_store_name(sno);
		WantVO wvo = new WantVO();
		wvo.setMno(mno);
		wvo.setSname(sname);
		wvo.setSno(sno);
		int ok = wdao.insert_want(wvo);
		return ok;
	}
	@Override
	public List<WantVO> want_list(long mno) {
		
		return wdao.want_get_list(mno);
	}
}
