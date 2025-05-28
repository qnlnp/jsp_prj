package kr.co.sist.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPageDTO {
	private String id,imgName,birth,tel;
	//id는 세션에서 가져올 거다~
	
}//class
