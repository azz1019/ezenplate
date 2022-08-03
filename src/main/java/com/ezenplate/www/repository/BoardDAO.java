package com.ezenplate.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezenplate.www.domain.BoardVO;
import com.ezenplate.www.domain.PagingVO;

public interface BoardDAO {
	int insert(BoardVO bvo); // register
	List<BoardVO> selectList(PagingVO pgvo); // list
	BoardVO selectDetail(long bno); // detail
	int update(BoardVO bvo); // update
	int delete(long bno); // delete
	int selectTotalCount(PagingVO pgvo);
	long selectLastBno(); 
	int updateReadCount(@Param("bno") long bno, @Param("i") int i);
	int updateCmtQty(@Param("bno") long bno, @Param("i") int i);
}
