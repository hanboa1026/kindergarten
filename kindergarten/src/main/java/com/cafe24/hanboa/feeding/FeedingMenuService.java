package com.cafe24.hanboa.feeding;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FeedingMenuService {
	
	@Autowired
	private FeedingMenuDao femeDao;
	private static final Logger logger = LoggerFactory.getLogger(FeedingMenuService.class);
	
	// 1.전체조회
	public Map<String, Object> getFeedingMenuList(int currentPage, int pagePerRow, String searchOption, String keyword){
		logger.debug("{} <-- getFeedingMenuList메서드 실행(currentPage) FeedingMenuService.java",currentPage);
		logger.debug("{} <-- getFeedingMenuList메서드 실행(pagePerRow) FeedingMenuService.java",pagePerRow);
		logger.debug("{} <-- getFeedingMenuList메서드 실행(searchOption) FeedingMenuService.java",searchOption);
		logger.debug("{} <-- getFeedingMenuList메서드 실행(keyword) FeedingMenuService.java",keyword);
		int startPage = 0;
		if(currentPage > 1) {
			startPage = (currentPage-1)*pagePerRow;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("startPage", startPage);
		map.put("pagePerRow", pagePerRow);
		List<FeedingMenu> list = femeDao.selectFeedingMenu(map);
		logger.debug("{} <- getFeedingMenuList FeedingMenuService.java", list);
		// 총 행의 수를 보여줄 행의 수로 나눈 뒤 나머지가 0일 경우는 넘어가고 아닐 경우 +1 한다.
		int count = femeDao.selectFeedingMenuCountByPage(map);
		logger.debug("{} : < - count FeedingMenuService.java",count);
		int countPage = count/pagePerRow;
		if(count%pagePerRow !=0) {
			countPage++;
		}
		logger.debug("{} : < - countPage FeedingMenuService.java", countPage);
		// list 페이지 수 리턴
		Map<String, Object> returnMap = new HashMap<String,Object>();
		returnMap.put("searchOption", searchOption);
		returnMap.put("keyword", keyword);
		returnMap.put("list", list);
		returnMap.put("countPage", countPage);
		return returnMap;
	}
	
	// 2. 수정정보요청
	public FeedingMenu modifyGetfeedingMenu(String feedingMenuCd) {
		FeedingMenu ModiftGetfeedingMenu = femeDao.modifyGetFeedingMenu(feedingMenuCd);
		logger.debug("{} <- feedingmenu FeedingMenuService.java",feedingMenuCd);
		logger.debug("{} <- feedingmenu FeedingMenuService.java",ModiftGetfeedingMenu);
		return ModiftGetfeedingMenu;
	}
	
	// 3.수정처리
	public int updateFeedingMenu(FeedingMenu feedingMenu) {
		int modifyFeedingMenu = femeDao.updateFeedingMenu(feedingMenu);
		logger.debug("{} <-- updateFeedingMenu FeedingMenuService.java",feedingMenu);
		logger.debug("{} <-- updateFeedingMenu FeedingMenuService.java",modifyFeedingMenu);
		return modifyFeedingMenu;		
	}
	
	// 4.입력처리
	public void insertFeedingMenu(FeedingMenu feedingMenu) {
		femeDao.insertFeedingMenu(feedingMenu);
		logger.debug("{} < -- insertFeedingMenu FeedingMenuService.java",feedingMenu);
	}
	
	//5. 삭제처리
	public int feedingMenuDelete(String feedingMenuCd) {
		int delete = femeDao.feedingMenuDelete(feedingMenuCd);
		logger.debug("{} <-- feedingMenuDelete메서드 실행 FeedingMenuService.java",feedingMenuCd);
		logger.debug("{} <-- feedingMenuDelete메서드 실행 FeedingMenuService.java",delete);
		return delete;		
	}
	
}
