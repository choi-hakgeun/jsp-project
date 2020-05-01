package bean;

public class Board_Paging {
	int totListSize; // 검색된 결과의 전체 건수
	int totPage;
	int listSize = 10; // 보여줄 게시물 수
	int blockSize = 5;
	int nowPage = 1; // 현재 페이지
	int startNo;
	int endNo;
	int startPage;
	int endPage;
	String findStr = "";
	
	
	public Board_Paging() {
		
	}
	
	public Board_Paging(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		PageCompute();
	}
	
	
	public void PageCompute() {
		totPage = (int)Math.ceil(totListSize / (double) listSize);
		endNo = nowPage * listSize;
		startNo = endNo-listSize+1;
		if(endNo>totListSize) endNo = totListSize;
		
		endPage = (int)Math.ceil(nowPage/(double)blockSize) * blockSize;
		startPage = endPage-blockSize+1;
		
		if(endPage>totPage) endPage = totPage;
		
	}
	public int getBlockSize() {
		return blockSize;
	}
	
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
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
	
	public int getTotListSize() {
		return totListSize;
	}
	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
}
