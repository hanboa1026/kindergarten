package com.cafe24.hanboa.program;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProgramService {
	@Autowired
	private ProgramDao programDao;
	private static final Logger logger = LoggerFactory.getLogger(ProgramService.class);
	
	// Program 전체 조회(교직원)
	public List<Program> selectProgramList() {
		logger.debug("{} <- selectProgramList ProgramService.java");
		return programDao.getProgramList();
	}	
	// Program 수정 정보요청
	public Program modifyGetProgram(String programCd) {
		logger.debug("{} <- modifyGetProgram ProgramService.java");
		Program program = programDao.modifyGetProgram(programCd);
		return program;
	}
	// Program 수정
	public int programModify(Program program) {
		logger.debug("{} <- programModify ProgramService.java");
		int programOne = programDao.programModify(program);
		return programOne;
	}
}
