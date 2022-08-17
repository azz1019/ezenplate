package com.ezenplate.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezenplate.www.domain.CommentVO;
import com.ezenplate.www.domain.PagingVO;

public interface CommentDAO {
	int insert(CommentVO cvo); // insert
	List<CommentVO> selectList(@Param("bno")long bno, @Param("pgvo") PagingVO pgvo); // list
	int update(CommentVO cvo); // update
	int delete(long cno); // delete 
	int selectTotalCount(long bno); // count comment
	long selectBno(long bno);
}
