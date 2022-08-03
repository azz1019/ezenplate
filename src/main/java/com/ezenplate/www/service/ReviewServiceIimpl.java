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

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ReviewServiceIimpl implements ReviewService {
	
	@Inject
	private ReviewDAO rdao;
	@Inject
	private FileDAO fdao;
	
	
	@Override
	public int register(ReviewDTO rdto) {
		int isUp = rdao.insert_review(rdto.getRvo());
		if(isUp > 0 && rdto.getFileList().size() > 0) {
			long rno = rdao.select_last_rno();
			for (FileVO fvo : rdto.getFileList()) {
				fvo.setRno(rno);
				isUp *= fdao.insertFile(fvo);
			}
		}
		return isUp;
	}

	@Override
	public List<ReviewDTO> get_list(long sno, PagingVO pgvo) {
		List<ReviewDTO> dto = null;
		List<ReviewVO> rvo = rdao.review_list(sno, pgvo);
		for (ReviewVO reviewVO : rvo) {
			List<FileVO> fvo = fdao.select_review(reviewVO.getRno());
			dto.add(new ReviewDTO(reviewVO, fvo));
		}
		return dto;
	}

	@Override
	public ReviewDTO get_review(long rno) {
		ReviewVO rvo = rdao.get_review(rno);
		List<FileVO> fvo = fdao.select_review(rno);
		
		return new ReviewDTO(rvo, fvo);
	}

	@Override
	public void remove(long rno) {
		int isUp = rdao.delete_review(rno);
		if(isUp > 0) {
			fdao.delete_review_File(rno);
			log.info("review_delete !!!!");
		}
	}

	@Override
	public int modify(ReviewDTO rdto) {
		int isUp = rdao.update(rdto.getRvo());
		if(rdto.getFileList() != null) {
			if(isUp > 0 && rdto.getFileList().size() > 0) {
				for (FileVO fvo : rdto.getFileList()) {
					fvo.setRno(rdto.getRvo().getRno());
					isUp *= fdao.insertFile(fvo);
							
					
				}
			}
		}
		return 0;
	}

	@Override
	public void report(long rno) {
		rdao.update_report(rno);
		
	}
	

}
