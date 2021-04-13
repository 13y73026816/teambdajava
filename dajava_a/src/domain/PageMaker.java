package domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageMaker {                      //하단넘버줄 만듬, vo와 같이 데이터 모아두는 곳.
	
	private int totalCount;
	private int startPage;
	private int endPage;
	boolean prev;
	boolean next;
	private int displayPageNum = 10;  
	private SearchCriteria scri;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();		
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}
	
	
	public void calcData(){
		//네비게이션의 끝페이지
		endPage = (int) (Math.ceil(scri.getPage()/(double)displayPageNum) * displayPageNum);  //ceil..올림
		//네비게이션의 시작 페이지
		startPage = (endPage - displayPageNum)+1;
		
		//임시끝페이지
		int tempEndPage = (int) (Math.ceil(totalCount/(double) scri.getPerPageNum()));
		
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}			
		//이전 다음 버튼
		prev = startPage == 1 ? false : true;		
		next = endPage * scri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String encoding(String keyword){
		
		if(keyword==null || keyword.trim().length()==0){
			return "";
		}		
		try{
			return URLEncoder.encode(keyword, "UTF-8");
		}catch(UnsupportedEncodingException e){
			return "";			
		}
	}
	
}
