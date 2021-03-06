package com.cafe24.hanboa.feeding;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class FeedingMonthlyDao {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	private static Logger logger = LoggerFactory.getLogger(FeedingMonthlyDao.class);
	
	String localName = "com.cafe24.hanboa.feeding.FeedingMapper.";
	
	//1. 전제조회
	public List<FeedingMonthly> getFeedingMonthlyList(HashMap<String, Object> map){
		logger.debug("{}< -- getFeedingMonthlyList FeedingMonthlyDao.java",map);
		return sessionTemplate.selectList(localName+"getfemoList",map);
	}
	
	//1-2 월별급식 총 목록 조회
	public int selectFemoTotalCount() {
		logger.debug("{}< -- selectFemoTotalCount FeedingMonthlyDao.java");
		return sessionTemplate.selectOne(localName+"getFemoTotalCount");
	}
	
	//2. 수정정보요청
	public FeedingMonthly modifyGetFeedingMonthly(String feedingMonthly) {
		logger.debug("< -- modifyGetFeedingMonthly FeedingMonthlyDao.java",feedingMonthly);
		return sessionTemplate.selectOne(localName+"getfemoOne",feedingMonthly);
	}
		
	//3. 수정처리
	public int FeedingMonthlyModify(FeedingMonthly feedingMonthly) {
		logger.debug("< -- FeedingMonthlyModify FeedingMonthlyDao.java",feedingMonthly);
		return sessionTemplate.update(localName+"modifyFemo",feedingMonthly);		
	}
	
	//4.입력처리
	public int feedingMonthlyAdd(FeedingMonthly feedingMonthly) {
		logger.debug("<-- feedingMonthlyAdd 메서드 실행 FeedingMonthlyDao.java");
		return sessionTemplate.insert(localName+"AddFemo",feedingMonthly);
	}
	
	//4-1 client,contract join 불러오기
	public List<FeedingMonthlyAndClientAndContract> callClientAndContract(){
		logger.debug("<-- callClientAndContract 메서드 실행 FeedingMonthlyDao.java");
		return sessionTemplate.selectList(localName+"callClientContract");		
	}
	
	
	//5.삭제처리
	public int feedingMonthlyDelete(String feedingMonthlyCd) {
		logger.debug("{} < --feedingMonthlyDelete메서드 실행  FeedingMonthlyDao.java",feedingMonthlyCd);
		return sessionTemplate.delete(localName+"femoDelete",feedingMonthlyCd);		
	}
	

}
