package com.ezenplate.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezenplate.www.domain.FileVO;

public interface FileDAO {
	public int insertMemberFile(@Param("fvo")FileVO fvo); // 사용자 파일 등록
	public FileVO selectMemberListFile(long mno); // 사용자 파일 목록
	public int deleteMemberFile(long mno); // 사용자 파일 삭제
	
	public int insertStoreFile(@Param("fvo")FileVO fvo); // 식당 파일 등록
	public List<FileVO> selectStoreListFile(long sno); // 식당 파일 목록
	public int deleteAllStoreFile(long sno); // 식당 파일 삭제
	
	public int insertReviewFile(@Param("fvo")FileVO fvo); // 리뷰 파일 등록
	public List<FileVO> selectReviewListFile(long rno); // 리뷰 파일 목록
	public int deleteAllReviewFile(long rno); // 리뷰 파일 삭제

	public int insertBoardFile(@Param("fvo")FileVO fvo); // register board file
	public List<FileVO> selectBoardListFile(Long bno); // list of bard files
	public int deleteBoardFile(long bno); // delete board file

	public int deleteFile(String uuid); // 파일 삭제
	public List<FileVO> selectAllFiles(); // 전체 파일 목록
}
