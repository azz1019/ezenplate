package com.ezenplate.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.StoreDTO;
import com.ezenplate.www.domain.StoreVO;
import com.ezenplate.www.repository.FileDAO;
import com.ezenplate.www.repository.StoreDAO;

@Service
public class StoreServiceImpl implements StoreService {
	@Inject
	private StoreDAO sdao;
	
	@Inject
	private FileDAO fdao;
	
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
	public StoreDTO getDetail(long sno) {
		return new StoreDTO(sdao.selectOne(sno), fdao.selectStoreListFile(sno));
	}

	@Override
	public int remove(long sno) {
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
	public int removeFile(String uuid) {
		return fdao.deleteFile(uuid);
	}

}
