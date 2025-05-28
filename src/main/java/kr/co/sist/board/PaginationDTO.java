package kr.co.sist.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class PaginationDTO {
	int pageNumber, currentPage, totalPage;
	String field, keyword, url;
}//class
