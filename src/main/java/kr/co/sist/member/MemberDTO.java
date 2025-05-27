package kr.co.sist.member;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 */
@Getter
@Setter
@ToString
public class MemberDTO {
	private String id, pass, name, birth;
	private String tel, email, gender, zipcode;
	private String addr, addr2, intro, ip;
	private Date input_date;
	private String useEmail, domain;
	private String profile;
}//class
