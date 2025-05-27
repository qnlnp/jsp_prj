package kr.co.sist.place;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 */
@Getter
@Setter
@ToString
public class PlaceDTO {
	private String field, keyword; //검색필드, 키워드
	private int currentPage=1, startNum, endNum;//현재 페이지, 시작번호, 끝번호
	
	private String[] fieldText= {"가게명","메뉴","작성자"};//검색을 해보자~
	
//	private String fieldName;
	public String getFieldName() {//엉뚱한게 들어와도,,, 제목으로 검색하겠다는 것
		String fieldName="restaurant";
		
		if("1".equals(field)) {
			fieldName="menu";
		}//end if
		if("2".equals(field)) {
			fieldName="id";
		}//end if
		
		return fieldName;
	}//getFieldName
	
}//class
