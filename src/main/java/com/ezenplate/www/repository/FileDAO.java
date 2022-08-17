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
	
	/* 맛집 목록 및 검색*/
	int insertFile(FileVO fvo);
	int insert_user_th(FileVO file);
	List<FileVO> selectListFile(long no);

	int deleteAllFile(long no);
	
	FileVO selectFile(String email);
	List<FileVO> select_store_file(long sno); // 검색한 맛집 이미지 파일 가져오기
	List<FileVO> select_store_all_file(long sno); // 전체 맛집 이미지 파일 가져오기
	List<FileVO> select_review(long rno); // 맛집 리뷰 이미지 파일 가져오기
	int delete_review_File(long rno); // 맛집 리뷰 이미지 삭제 시 
	List<FileVO> selectBoardListFile(long bno);
//	int deleteFile(String uuid); // 중복
//	List<FileVO> selectAllFiles(); // 중복
//	int deleteBoardFile(long bno);  //중복
//	int insertBoardFile(FileVO fvo); //중복
	int insert_review_file(FileVO fvo); // 리뷰 이미지 추가
	public FileVO select_member_img(long mno); // 회원 프로필
}
