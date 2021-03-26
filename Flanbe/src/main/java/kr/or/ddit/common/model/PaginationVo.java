package kr.or.ddit.common.model;

public class PaginationVo {

	
	/** 한 페이지당 게시글 수 **/
    private int pageSize = 5;
    
    /** 한 블럭(range)당 페이지 수 **/
    private int rangeSize = 5;
    
    /** 현재 페이지 **/
    private int curPage = 1;
    
    /** 현재 블럭(range) **/
    private int curRange = 1;
    
    /** 총 게시글 수 **/
    private int listCnt;
    
    /** 총 페이지 수 **/
    private int pageCnt;
    
    /** 총 블럭(range) 수 **/
    private int rangeCnt;
    
    /** 시작 페이지 **/
    private int startPage = 1;
    
    /** 끝 페이지 **/
    private int endPage = 1;
    
    /** 시작 index **/
    private int startIndex = 0;
    
    /** 이전 페이지 **/
    private int prevPage;
    
    /** 다음 페이지 **/
    private int nextPage;
    
    
	 public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getCurRange() {
		return curRange;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getRangeCnt() {
		return rangeCnt;
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
	public int getStartIndex() {
		return startIndex;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	//dao 에 만들어 주는것 . 
	//pagination 만 하면 밑에 있는 모든 메소드를 구현이 다 되는거다. 
	//listCnt , curPage => 전체 리스트의 수와 현재 페이지set 
    public PaginationVo(int listCnt, int curPage){
        
        // 총 게시물 수와 현재 페이지를 Controller로 부터 받아온다. => 기본 getter , setter 
        /** 현재페이지 세팅 **/
        setCurPage(curPage);
        /** 총 게시물 수  **/
        setListCnt(listCnt);
        
        //메서드 
        /** 1. listCnt를 바탕으로 페이지의 Cnt 를 셋팅한다. **/
        setPageCnt(listCnt);
        /** 2. 총 블럭(range)수 **/
        setRangeCnt(pageCnt);
        /** 3. 블럭(range) setting **/
        rangeSetting(curPage);
        
        /** DB 질의를 위한 startIndex 설정 **/
        setStartIndex(curPage);
    }
 
    //총 페이지 수 
    public void setPageCnt(int listCnt) {
    	//1.0 을 곱하는 이유 : 더블로 만들어줘서 만약 소숫점뒤에 값이 있으면 1개를 더 올려줘서 페이지 한개를 더 생성. 
        this.pageCnt = (int) Math.ceil(listCnt*1.0/pageSize);
    }
    //총페이지수를 구한후 그 값을 rangeSize 로 나눠서 몇개의 덩어리로 페이지가 이루어질까?를 구함 
    public void setRangeCnt(int pageCnt) {
        this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
    }
    
    //현재 페이지를 파라미터로 넣어준다. 
    public void rangeSetting(int curPage){
        //밑에 있는 setCurRange 에 현재 페이지를 넣어서 
        setCurRange(curPage);        
        
        //startPage 와 endPage 는 현재 range 블럭 안의 첫번쨰 페이지부터 마지막 페이지까지 값(현재 페이지 리스트중에서 첫번째 값과 나중에 값과는 다른값) 
        //range 의 첫번째 페이지는 지금 현재의 range 는 알 수 있으니까 현재 range 블럭에서 -1 하면 그 전블럭으로 되고 그것 곱하기 rangeSize 를 곱하고 1을 더해준다. 
        
        this.startPage = (curRange - 1) * rangeSize + 1;
        //range 의 마지막 페이지는 startPage 에서 range 의 크기만큼 더하면 다음 range 의 첫번째 값이 되니까 거기서 1을 빼준다.
        this.endPage = startPage + rangeSize - 1;
        
        //endPage 는 사실상 range 블럭의 마지막인데 그것이 블럭이 모두 다 채워진 상태면 끝값이 될테고 만약 그것이 구했던 전체 page 숫자보다 클경우 그 차이만큼 페이지가 존재하지 않는다는 뜻. 
        //그래서 만약 endPage(예 : 50인데)가 pageCnt(47) 보다 클경우 3만큼의 페이지는 존재하지 않는것. 그래서 그냥 47로 지정해준다. 
        if(endPage > pageCnt){
            this.endPage = pageCnt;
        }
        
        //여기서 글쓴 블루고는 처리를 다른데서 해준것 같지만 나는 여기서 처리를 해주고 싶다. 왜냐면 이것을 jsp 단에서 계속 처리를 해줬는데 생각보다 <c:choose > <c:when> <c:if 이런게 귀찮아진다.. 
        
        //현재페이지가 1일때는 prevPage도 1로 설정해준다. 
        if(curPage == 1 ) {
        	this.prevPage = 1;   
        }else {
        	this.prevPage = curPage - 1;
        }
        
        //현재페이지가 마지막페이지랑 같을 경우 이때는 nextPage 를 마지막 페이지로 설정해준다. (예전 프로젝트에서는 아예 jsp 단에서 버튼을 숨겨버림)
        if(curPage == pageCnt) {
        	this.nextPage = pageCnt ;  
        }else {
        	this.nextPage = curPage + 1;
        }
    
    
    }
    public void setCurRange(int curPage) {
     //현재의 range 를 알려면 현재 페이지의 전 페이지를 rangeSize 설정해 둔 것으로 나누면 나머지를 없애는 int 로 형변환하는순간 소숫점아래 자리는 사라지고 
    	this.curRange = (int)((curPage-1)/rangeSize) + 1;
    }
    //이건 db 리스트에 넘겨줄 값인데 , list<vo> 값들중에 몇번부터 몇번까지 값을 뽑을지를 보내줄거야xml에 rn(Rownum을 inline 뷰로 묶고 난뒤 별칭) between {start} and {end} 여기에 start 에 넣을값 . 
    public void setStartIndex(int curPage) {
        this.startIndex = (curPage-1) * pageSize;
    }
 
	
	
}