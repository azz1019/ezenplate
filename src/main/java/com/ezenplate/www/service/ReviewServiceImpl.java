package com.ezenplate.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewDTO;
import com.ezenplate.www.domain.ReviewVO;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.repository.FileDAO;
import com.ezenplate.www.repository.ReviewDAO;
import com.ezenplate.www.repository.StoreDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	private ReviewDAO rdao;
	@Inject
	private StoreDAO sdao;
	@Inject
	private FileDAO fdao;

	@Override
	public int register(ReviewDTO rdto) {
		int isUp = rdao.insert(rdto.getRvo());
		if(rdto.getFileList() != null) {
			if((isUp > 0) && (rdto.getFileList().size() > 0)) {
				long rno = rdao.selectLastRno();
				for (FileVO fvo : rdto.getFileList()) {
					fvo.setRno(rno);
					isUp *= fdao.insertReviewFile(fvo);
				}
			}
		}
		sdao.up_cmt(rdto.getRvo().getSno());
		return isUp;
	}

	@Override
	public List<ReviewVO> getList(PagingVO pgvo) {
		return rdao.selectList(pgvo);
	}

	@Override
	public ReviewDTO getDetail(long rno) {
		return new ReviewDTO(rdao.selectOne(rno), fdao.selectReviewListFile(rno));
	}

	@Override
	public int modify(ReviewDTO rdto) {
		int isUp = rdao.update(rdto.getRvo());
		if(rdto.getFileList() != null) {
			if((isUp > 0) && (rdto.getFileList().size() > 0)) {
				for (FileVO fvo : rdto.getFileList()) {
					fvo.setRno(rdto.getRvo().getRno());
					isUp *= fdao.insertReviewFile(fvo);
				}
			}
		}
		return isUp;
	}

	@Override
	public int remove(long rno) {
		long sno = rdao.select_sno(rno);
		int isUp = rdao.remove(rno);
		if(isUp > 0) {
			isUp = fdao.deleteAllReviewFile(rno);
		}
		sdao.down_cmt(sno);
		return isUp;
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return rdao.selectTotalCount(pgvo);
	}
	
	@Override
	public int getMyTotalCount(PagingVO pgvo, String email) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("email", email);
		
		return rdao.selectMyTotalCount(map);
	}
	
	@Override
	public List<ReviewVO> getMyList(PagingVO pgvo, String email) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("email", email);
		
		return rdao.selectMyList(map);
	}

	@Override
	public int removeFile(String uuid) {
		return fdao.deleteFile(uuid);
	}

	@Override
	public List<ReviewDTO> get_list(long sno) {
		List<ReviewDTO> dto = new ArrayList<ReviewDTO>();
		List<ReviewVO> rvo = rdao.review_list(sno);
		float rate = 0;
		int i=0;
		for (ReviewVO reviewVO : rvo) {
			List<FileVO> fvo = fdao.select_review(reviewVO.getRno());
			dto.add(new ReviewDTO(reviewVO, fvo));
			rate +=reviewVO.getRate();
			i++;
		}
		sdao.request_rate(rate/i, sno);
		return dto;
	}

	@Override
	public ReviewDTO get_review(long rno) {
		ReviewVO rvo = rdao.get_review(rno);
		List<FileVO> fvo = fdao.select_review(rno);

		return new ReviewDTO(rvo, fvo);
	}
	
	@Override
	public void report(long rno) {
		rdao.update_report(rno);
	}

	@Override
	public List<ReviewVO> getlistall() {
		rdao.update_report(0);
		return rdao.selectAll();
	}

	@Override
	public List<ReviewVO> getListGood() {
		return rdao.selectListGood();
	}

//	@Override
//	public List<ReviewVO> getListNomal() {
//		return rdao.selectListNomal();
//	}

	@Override
	public List<ReviewVO> getListbad() {
		return rdao.selectListBad();
	}

	@Override
	public int getHolicTotalCount(PagingVO pgvo) {
		return rdao.selectgetHolicTotalCount();
	}

	@Override
	public int getGoodTotalCount(PagingVO pgvo) {
		return rdao.selectGoodHolicTotalCount();
	}

	@Override
	public int getbadTotalCount(PagingVO pgvo) {
		return rdao.selectBadTotalCount();
	}
	
	@Override
	public int cancel(ReviewVO rvo) {
		return rdao.reportcancel(rvo);
	}


}
