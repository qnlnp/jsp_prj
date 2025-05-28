package kr.co.sist.place;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDAO;
import kr.co.sist.place.PlaceDTO;

public class PlaceService {

	/**
	 * 맛집을 추가합니다.
	 * @param rDTO 식당명,메뉴,가격,정보,위도,경도,ip,id
	 * @return
	 */
	public boolean writeRestaurant( RestDTO rDTO) {
		boolean flag=false;
		
		PlaceDAO rDAO = PlaceDAO.getInstance();
		try {
			rDAO.insertRestaurant(rDTO);
			//insert는 별일 없이 true~(암호화나 일방향해시 필요하면 하자~)
			flag=true;
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
	
		return flag;
	}//writeRestaurant
	
	
	/**
	 * 1. 총 레코드의 수
	 * @param rDTO
	 * @return 레코드의 수
	 */
	public int totalCount(PlaceDTO rDTO) {
		int cnt=0;
		PlaceDAO pDAO = PlaceDAO.getInstance();
		
		try {
			cnt=pDAO.selectTotalCount(rDTO);
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
	public int startNum(int pageScale, PlaceDTO rDTO) { //currentPage를 사용할거라서,,,
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
	public int endNum(int pageScale, PlaceDTO rDTO) {
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
	public List<RestDTO> searchRestaurant(PlaceDTO rDTO){
		List<RestDTO> list = new ArrayList<RestDTO>();
		
		PlaceDAO pDAO=PlaceDAO.getInstance();
		
		try {
			list=pDAO.selectRestaurant(rDTO);
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return list;
	}//searchRestaurant
	
	
	/**
	 * 
	 * @param rest_num
	 * @return
	 */
	public RestDTO searchOneRestaurant(int rest_num) {
		RestDTO rDTO=null;
		
		PlaceDAO pDAO = PlaceDAO.getInstance();
		
		try {
			rDTO = pDAO.selectOneRestaurant(rest_num);
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return rDTO;
	}//searchOneBoard
	
	
	
	
	
	
}//class
