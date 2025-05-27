package kr.co.sist.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.place.PlaceDAO;
import kr.co.sist.place.RestDTO;

public class BoardService {
	
	
	/**
	 * 1. 총 레코드의 수
	 * @param rDTO
	 * @return 레코드의 수
	 */
	public int totalCount(RangeDTO rDTO) {
		int cnt=0;
		BoardDAO bDAO = BoardDAO.getInstance();
		
		try {
			cnt=bDAO.selectTotalCount(rDTO);
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return cnt;
	}//totalCount
	
	/**
	 * 한 화면에 보여줄 게시물의 수
	 * @return 보여줄 게시물의 수
	 */
	public int pageScale() {
		int pageScale=10;
		
		return pageScale;
	}//pageScale
	
	/**
	 * 총 페이지 수
	 * @param totalCount 총 게시물의 수
	 * @param pageScale 스케일
	 * @return
	 */
	public int totalPage(int totalCount, int pageScale) {
		int totalPage=0;
		
		
		/*
		int remain=totalCount % pageScale;
		
		if(remain != 0) {
			totalPage = totalCount / pageScale;
		}else {
			totalPage =( totalCount / pageScale ) + 1;
		}//end else
		
		*/
		
		totalPage=(int)Math.ceil((double)totalCount/pageScale);
		
		
		return totalPage;
	}//totalPage
	
	/**
	 * pagination을 클릭했을 때의 번호를 사용하여<br>
	 * 해당페이지의 시작 번호를 구하기<br>
	 * 예 1-1, 2-11, 3-21, 4-31, 5-41, ,,,<br>
	 * @param pageScale
	 * @param rDTO
	 * @return
	 */
	public int startNum(int pageScale, RangeDTO rDTO) { //currentPage를 사용할거라서,,,
		int startNum=1;//초기값
		
		startNum=rDTO.getCurrentPage()*pageScale-pageScale+1;
		rDTO.setStartNum(startNum);
		
		return startNum;
	}//startNum
	
	/**
	 * pagination을 클릭했을 때의 번호를 사용하여,<br>
	 * 해당페이지의 끝 번호를 구하기<br>
	 * 	 * 예 1-10, 2-20, 3-30, 4-40, 5-50, ,,,<Br>
	 * @param pageScale
	 * @param rDTO
	 * @return
	 */
	public int endNum(int pageScale, RangeDTO rDTO) {
		int endNum=0;
		
		endNum = rDTO.getStartNum()+pageScale-1;
		rDTO.setEndNum(endNum);
		
		return endNum;
	}//endNum
	
	/**
	 * 시작 번호(startNum)과 끝 번호(endNum) 사이의<br>
	 * 게시물을 조회하기<br>
	 * @param rDTO
	 * @return
	 */
	public List<BoardDTO> searchBoard(RangeDTO rDTO){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		BoardDAO bDAO=BoardDAO.getInstance();
		
		try {
			list=bDAO.selecBoard(rDTO);
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return list;
	}//searchBoard
	
	/**
	 * 게시판 글쓰기
	 * @param bDTO
	 * @return
	 */
	public boolean writeBoard(BoardDTO bDTO) {
		boolean flag=false;
		
		
		BoardDAO bDAO = BoardDAO.getInstance();
		try {
			bDAO.insertBoard(bDTO);
			//insert는 별일 없이 true~(암호화나 일방향해시 필요하면 하자~)
			flag=true;
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		
		
		return flag;
	}//writeBoard
	
	public RestDTO searchOneRestaurant(int rest_num) {
		RestDTO pDTO=null;
		
		PlaceDAO pDAO = PlaceDAO.getInstance();
		
		try {
			pDTO = pDAO.selectOneRestaurant(rest_num);
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return pDTO;
	}//searchOneRestaurant
	
	/**
	 * 조회수 증가
	 * @param num
	 */
	public void modifyCnt( int num ) {
	
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			bDAO.updateCnt(num);
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
	}//modifyCnt
	
	/**
	 * 해당 세션의 사용자가 (자신의) 게시글을 삭제
	 * @param bDTO
	 * @return
	 */
	public boolean deleteBoard(BoardDTO bDTO) {
		boolean flag=false;
		
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			bDAO.deleteBoard(bDTO);
			flag=true;
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return flag;
	}//deleteBoard
	
	/**
	 * @param bDTO
	 * @return
	 */
	public boolean modifyBoard(BoardDTO bDTO) {
		boolean flag=false;
		
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			bDAO.updateBoard(bDTO);
			flag=true;
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return flag;
	}//modifyBoard
	
	
}//class









