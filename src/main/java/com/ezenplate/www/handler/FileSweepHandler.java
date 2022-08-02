package com.ezenplate.www.handler;

import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.repository.FileDAO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@AllArgsConstructor
public class FileSweepHandler {
	private final String UP_DIR = "C:\\_java\\lec\\_spring\\uploaded\\";
	
	@Inject
	private FileDAO fdao;
	
	// 패턴 (cron = "초 분 시 일 월 요일 년도(생략가능)")
	@Scheduled(cron = "1 00 17 * * *")
	public void fileSweeper() throws Exception {
		log.info(">>> fileSweeper Running Start : {}", LocalDateTime.now());
		
		// 데이터베이스에 등록된 파일 목록 가져오기 : 남겨야 할 파 일목록
		List<FileVO> dbFileList = fdao.selectAllFiles();
		
		// 로컬 물리 디스크에 남겨야 할 파일을 검색하기 위한 리스트
		List<String> savedFileList = new ArrayList<>();
		for (FileVO fvo : dbFileList) {
			String filePath = fvo.getSaveDir() + "\\" + fvo.getUuid();
			String fileName = fvo.getFileName();
			savedFileList.add(UP_DIR + filePath + "_" + fileName);
			// 이미지 파일일 경우 썸네일 파일 경로도 추가
			if(fvo.getFileType() > 0) {
				savedFileList.add(UP_DIR + filePath + "_th_" + fileName);
			}
		}

		LocalDate now = LocalDate.now();
		//String targetDay = now.minusDays(1).toString(); // 어제 생성된 파일 지우기
		String targetDay = now.toString(); // 오늘 생성된 파일 지우기
		targetDay = targetDay.replace("-", File.separator);
		
		// 경로를 기반으로 저장되어 있는 파일 검색
		// 날짜를 반영한 폴더 객체 만들기
		File dir = Paths.get(UP_DIR + targetDay).toFile();
		File[] allFileObjects = dir.listFiles();
		
		// 물리 디스크에 남아있는 파일 객체와 DB에 기록된 파일 목록을 비교하여 삭제 진행
		for (File file : allFileObjects) {
			String storedFileName = file.toPath().toString();
			if(!savedFileList.contains(storedFileName)) {
				file.delete();
				log.info(">>> delete file : {}", storedFileName);
			}
		}
		log.info(">>> fileSweeper Running Finish : {}", LocalDateTime.now());
	}
}
