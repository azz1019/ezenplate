package com.ezenplate.www.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.StoreDTO;
import com.ezenplate.www.domain.StoreVO;
import com.ezenplate.www.repository.FileDAO;
import com.ezenplate.www.repository.ReviewDAO;
import com.ezenplate.www.repository.StoreDAO;

@Service
public class StoreServiceImpl implements StoreService {
	@Inject
	private StoreDAO sdao;
	
	@Inject
	private FileDAO fdao;
	@Inject
	private ReviewDAO rdao;
	@Override
	public int register(StoreDTO sdto) {
		int isUp = sdao.insert(sdto.getSvo());
		if(sdto.getFileList() != null) {
			if((isUp > 0) && (sdto.getFileList().size() > 0)) {
				long sno = sdao.selectLastSno();
				for (FileVO fvo : sdto.getFileList()) {
					fvo.setSno(sno);
					isUp *= fdao.insertStoreFile(fvo);
				}
			}
		}
		return isUp;
	}

	@Override
	public List<StoreVO> getList(PagingVO pgvo) {
		return sdao.selectList(pgvo);
	}
	
	@Override
	public List<StoreVO> getMyList(PagingVO pgvo, String email) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("email", email);
		
		return sdao.selectMyList(map);
	}

	@Override
	public StoreDTO getDetail(long sno) {
		return new StoreDTO(sdao.selectOne(sno), fdao.selectStoreListFile(sno));
	}

	@Override
	public int remove(long sno) {
		List<Long> rum = rdao.select_sno_rno(sno);
		rdao.delete_store_review(sno);
		for (Long rno : rum) {
			
			fdao.delete_review_File(rno);
		}
		int isUp = sdao.remove(sno);
		if(isUp > 0) {
			isUp = fdao.deleteAllStoreFile(sno);
		}
		return isUp;
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return sdao.selectTotalCount(pgvo);
	}
	
	@Override
	public int getMyTotalCount(PagingVO pgvo, String email) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("email", email);
		
		return sdao.selectMyTotalCount(map);
	}

	@Override
	public int removeFile(String uuid) {
		return fdao.deleteFile(uuid);
	}
	
	/* 맛집 목록 및 검색 */
	
	
	@Override
	public List<StoreDTO> store_list(PagingVO pgvo) {
		List<StoreDTO> dto = new ArrayList<StoreDTO>();
		List<StoreVO> svo = sdao.select_store_list(pgvo);
		for (StoreVO storeVO : svo) {
			long sno = storeVO.getSno();
			List<FileVO> list = fdao.select_store_file(sno);
			 dto.add(new StoreDTO(storeVO, list));
		}
		return dto;
	}


	@Override
	public List<StoreDTO> search_store_list(PagingVO pgvo) {
		List<StoreDTO> dto = new ArrayList<StoreDTO>();
		List<StoreVO> svo = sdao.select_search_store(pgvo);
		for (StoreVO storeVO : svo) {
			long sno = storeVO.getSno();
			List<FileVO> list = fdao.select_store_file(sno);
			dto.add(new StoreDTO(storeVO, list));
		}
		return dto;
	}

	@Override
	public int get_search_all_Count(PagingVO pgvo) {
		return sdao.select_total_count(pgvo);
	}

	@Override
	public int get_search_count(PagingVO pgvo) {
		return sdao.select_search_count(pgvo);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public StoreDTO get_store(long sno, int i) {
		if(i > 0) {
			sdao.update_readcount(sno, 1);
		}
		return new StoreDTO(sdao.select_one(sno), fdao.select_store_all_file(sno));
	}

	@Override
	public int getTotal_Count(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<StoreDTO> view_more() {
		List<StoreDTO> dto = new ArrayList<StoreDTO>();
		List<StoreVO> svo = sdao.select_more_view();
		for (StoreVO storeVO : svo) {
			long sno = storeVO.getSno();
			List<FileVO> list = fdao.select_store_file(sno);
			 dto.add(new StoreDTO(storeVO, list));
		}
		return dto;
	}
	
	@Override
	public int admit(StoreVO svo) {
		return sdao.admitStore(svo);
	}
	
	@Override
	public int getTotalApproveCount(PagingVO pgvo) {
		return sdao.selectTotalApproveCount(pgvo);
	}

	@Override
	public List<StoreVO> getApproveList(PagingVO pgvo) {
		return sdao.selectApproveList(pgvo);
	}
}
