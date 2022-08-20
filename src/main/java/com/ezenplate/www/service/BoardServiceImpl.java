package com.ezenplate.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ezenplate.www.domain.BoardDTO;
import com.ezenplate.www.domain.BoardVO;
import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.repository.BoardDAO;
import com.ezenplate.www.repository.FileDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO bdao;
	
	@Inject
	private FileDAO fdao;
	
	@Override
	public int register(BoardDTO bdto) {
		int isUp = bdao.insert(bdto.getBvo());
		if(bdto.getFileList() != null) {
			if((isUp > 0) && (bdto.getFileList().size() > 0)) {
				long bno = bdao.selectLastBno();
				for(FileVO fvo : bdto.getFileList()) {
					fvo.setBno(bno);
					isUp *= fdao.insertBoardFile(fvo);
				}
			}
		}
		return isUp;
	}

	@Override
	public List<BoardDTO> getList(PagingVO pgvo) {
		List<BoardDTO> bdto = new ArrayList<BoardDTO>();
		List<BoardVO> bvo = bdao.selectList(pgvo);
		for(BoardVO boardVO : bvo) {
			long bno = boardVO.getBno();
			List<FileVO> list = fdao.selectBoardListFile(bno);
			bdto.add(new BoardDTO(boardVO, list));
		}
		return bdto;
	}
	
	@Override
	public List<BoardDTO> getMyList(PagingVO pgvo, String nickName) {
		List<BoardDTO> bdto = new ArrayList<BoardDTO>();
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("nickName", nickName);
		List<BoardVO> bvo = bdao.selectMyList(map);
		for(BoardVO boardVO : bvo) {
			long bno = boardVO.getBno();
			List<FileVO> list = fdao.selectBoardListFile(bno);
			bdto.add(new BoardDTO(boardVO, list));
		}
		return bdto;
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardDTO getDetail(long bno) {
		bdao.updateReadCount(bno, 1);
		return new BoardDTO(bdao.selectDetail(bno), fdao.selectBoardListFile(bno));
	}

	@Override
	public int modify(BoardDTO bdto) {
		int isUp = bdao.update(bdto.getBvo());
		isUp = bdao.updateReadCount(bdto.getBvo().getBno(), -2);
		if(bdto.getFileList() != null && isUp > 0) {
			long bno = bdto.getBvo().getBno();
			for(FileVO fvo : bdto.getFileList()) {
				fvo.setBno(bno);
				isUp *= fdao.insertBoardFile(fvo);
			}
		}
		return isUp;
	}

	@Override
	public int remove(long bno) {
		int isUp = bdao.delete(bno);
		if(isUp > 0) {
			isUp = fdao.deleteBoardFile(bno);
		}
		return isUp;
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.selectTotalCount(pgvo);
	}
	
	@Override
	public int getMyTotalCount(PagingVO pgvo, String nickName) {
		Map map = new HashMap();
		map.put("pgvo", pgvo);
		map.put("nickName", nickName);
		
		return bdao.selectMyTotalCount(map);
	}

	@Override
	public int removeFile(String uuid) {
		return fdao.deleteFile(uuid);
	}
}
