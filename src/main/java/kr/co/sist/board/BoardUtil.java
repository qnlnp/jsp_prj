package kr.co.sist.board;

/**
 * pagination 등,,, 기능들을 담은 클래스<br> 
 */
public class BoardUtil {
	
	//싱글톤 아니고,,, 객체 안만들려고~
	private BoardUtil() {
		
	}//BoardUtil
	
//	public static String pagination(int pageNumber, int currentPage,
//			int totalPage, String field, String keyword,
//			String url) {//아무래도,,, url이 가장 중요할것~~~~~~
	
	/**
	 * pagination 만드는 메소드<br>
	 * 
	 * pageNumber(생성한 인덱스 수)
	 * currentPage(사용자가 보고있는 현재 페이지)
	 * totalPage(게시글의 총 페이지수)
	 * field(검색필드:제목,내용,작성자)
	 * keyword(검색키워드)
	 * url(이동할 URL),,, 를 pDTO로 받아서<br>
	 * 
	 * 쪽번호[&lt;&lt;] ... [1][2][3] ... [&gt;&gt;] 를 생성하는 메소드<br>
	 * 
	 * @param pDTO
	 * @return
	 */
	public static String pagination( PaginationDTO pDTO ) {
		
		//field, keyword 받아와서,,, 안에서 쿼리스트링 만들려고
		//아니면 밖에서 쿼리스트링을,,, 밖에서 만들어와야한다~~
		
		
		String result="";
		StringBuilder searchQueryStr=new StringBuilder();
		//붙는 조건을 만들어보자~~
		if(  pDTO.getKeyword() != null && !pDTO.getKeyword().isEmpty()  ){
			searchQueryStr
			.append("&field=").append(pDTO.getField())
			.append("&keyword=").append(pDTO.getKeyword())
			;
		}//end if


//		int pageNumber=3; //1)한 화면에 보여줄,,, 페이지인덱스의 수
		
		
		//2)화면에 보여줄,,, 시작페이지 번호
		// int startPage=currentPage;
		int startPage=((pDTO.getCurrentPage()-1)/pDTO.getPageNumber())*pDTO.getPageNumber() +1;



		//3)화면에 보여줄,,, 마지막페이지 번호
		// int endPage=startPage+2;
		int endPage=(((startPage-1)+pDTO.getPageNumber())/pDTO.getPageNumber())*pDTO.getPageNumber();

		//4)총 페이지수가 연산된 마지막페이지수보다 작다면,,, 총페이지수가 마지막페이지수로 설정
		if(pDTO.getTotalPage() <= endPage){
			endPage=pDTO.getTotalPage();
		}//end if

		


		//5)첫페이지가 인덱스화면이 아닌경우(currentPage>pageNumber) 따져줘야한다~~
		//prevMark
		int movePage=0;
		StringBuilder prevMark=new StringBuilder("[ &lt;&lt; ]");
		// StringBuilder prevMark=new StringBuilder(" ");

		if( pDTO.getCurrentPage() > pDTO.getPageNumber() ){//시작페이지보다 1적은 페이지로 이동시킨다
			prevMark.delete(0, prevMark.length());
			movePage=startPage-1;
			//keyword, field 같이 넘겨줘야 한다~
//			prevMark.append("[ <a href='board_list.jsp?currentPage=")
			prevMark
			.append("[ <a href='").append(pDTO.getUrl()).append("?currentPage=")
			.append( movePage )
			///////////////////////////////////////
			.append( searchQueryStr.toString() )
			///////////////////////////////////////
			.append("'> &lt;&lt;</a> ]")
			;
		}//end if
		prevMark.append(" ... ");
		
		

		//6)시작페이지 번호부터,,, 끝페이지 번호까지 화면에 출력
		//pageLink
		movePage=startPage;
		StringBuilder pageLink = new StringBuilder();
		while( movePage <= endPage ){
			if( movePage == pDTO.getCurrentPage() ){//현재 페이지는 링크를 안걸려고~~
				pageLink.append("[ ").append(pDTO.getCurrentPage()).append(" ]");
			}else{
//				pageLink.append("[ <a href='board_list.jsp?currentPage=")
				pageLink
				.append("[ <a href='").append(pDTO.getUrl()).append("?currentPage=")
				.append( movePage )
				///////////////////////////////////////
				.append( searchQueryStr.toString() )
				///////////////////////////////////////
				.append("'>").append( movePage ).append("</a> ]");
			}//end else
			movePage++;
			
		}//end while
		pageLink.append(" ... ");
		
			
		//7)뒤에 페이지가 더 있는경우
		//nextMark

		StringBuilder nextMark=new StringBuilder("[ &gt;&gt; ] ");
		// StringBuilder nextMark=new StringBuilder(" ");
		if(pDTO.getTotalPage() > endPage ){
			nextMark.delete(0, nextMark.length());
			movePage=endPage+1;
//			nextMark.append("[ <a href='board_list.jsp?currentPage=")
			nextMark
			.append("[ <a href='").append(pDTO.getUrl()).append("?currentPage=")
			.append( movePage )
			///////////////////////////////////////
			.append( searchQueryStr.toString() )
			///////////////////////////////////////
			.append("'>").append( " &gt;&gt; " ).append("</a> ]");
		}//end if
		
		
		
		
		
		
		
		
		
		

		
		return prevMark.toString()+pageLink.toString()+nextMark.toString();
	}//pagination
	
}//class
