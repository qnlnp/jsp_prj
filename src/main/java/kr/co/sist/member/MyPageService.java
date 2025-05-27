package kr.co.sist.member;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.sist.cipher.DataDecryption;
import kr.co.sist.member.login.LoginResultDTO;

public class MyPageService {
	public boolean modifyMember(MyPageDTO mpDTO, HttpSession session) {
		
		
		boolean flag=false;
		MyPageDAO mpDAO = MyPageDAO.getInstance();
		
		try {
			//세션에서 아이디를 꺼내와서,,, DTO에 설정하려고~
			mpDTO.setId( ((LoginResultDTO)session.getAttribute("userData")).getId() );
			
			//TEL 복호화
			String key="abcdef0123456789";//키 관리 잘해야 한다~~!
			DataDecryption dd=new DataDecryption(key);
			
			//이미지를 선택하지 않았을때의 이미지 처리(다이나믹쿼리보다 간단하다~~)
			if(mpDTO.getImgName().isEmpty()) {
				mpDTO.setImgName("default.jpg");
			}//end if
			
			try {
				mpDTO.setTel(dd.decrypt(mpDTO.getTel()));
			} catch (Exception e) {
				e.printStackTrace();
			}//end catch
			
			mpDAO.updateMember(mpDTO);
			flag=true;
			
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return flag;
	}//modifyMember

}//class
