package com.ezenplate.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewDTO;
import com.ezenplate.www.domain.ReviewVO;
import com.ezenplate.www.repository.FileDAO;
import com.ezenplate.www.repository.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	private ReviewDAO rdao;
	
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
		int isUp = rdao.remove(rno);
		if(isUp > 0) {
			isUp = fdao.deleteAllReviewFile(rno);
		}
		return isUp;
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return rdao.selectTotalCount(pgvo);
	}

	@Override
	public int removeFile(String uuid) {
		return fdao.deleteFile(uuid);
	}
	
	//<!-- 맛집 검색-->
	@Override
	public List<ReviewDTO> get_list(long sno, PagingVO pvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReviewDTO get_review(long rno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void report(long rno) {
		// TODO Auto-generated method stub
		
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


}
