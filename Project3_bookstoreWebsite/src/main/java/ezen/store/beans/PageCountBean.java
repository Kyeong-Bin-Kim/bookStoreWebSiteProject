package ezen.store.beans;


public class PageCountBean {

	private int min; //최소페이지번호
	private int max; //최대페이지번호
	private int prevPage; //이전 버튼의 페이지 번호
	private int nextPage; //다음 버튼의 페이지 번호
	private int pageCnt;  //전체 페이지 갯수
	private int currentPage; //현재 페이지 번호
	private int firstContent; //현재 페이지 첫번째 글
	private int lastContent; //현재 페이지 마지막 글
	
	//contentCnt: 전체글개수, currentPage: 현재 페이지 번호, contentPageCnt: 페이지당 글 개수, pageButtonCnt: 페이지 버튼의 개수
	public PageCountBean(int contentCnt, int currentPage, int contentPageCnt, int pageButtonCnt) {
		
    // 현재 페이지번호
	this.currentPage = currentPage;
	
	//전체 페이지 개수
	pageCnt = contentCnt / contentPageCnt;
	
	if(contentCnt % contentPageCnt > 0) {
		pageCnt++;
		}	
	
	min = ((currentPage -1) / contentPageCnt) * contentPageCnt + 1;
	max = min + pageButtonCnt - 1;
	
	if(max > pageCnt) {
		max = pageCnt;
	}
	
	prevPage = min - 1;
	nextPage = max + 1;
	
	if(nextPage > pageCnt) {
		nextPage = pageCnt;
		}	
	
	firstContent = (currentPage-1) * contentPageCnt + 1;
	lastContent = firstContent + contentPageCnt -1;
	
	}
		
	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getFirstContent() {
		return firstContent;
	}
	public int getLastContent() {
		return lastContent;
	}
	
	
	
}
