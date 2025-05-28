package kr.co.sist.member.login;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.sist.util.cipher.DataDecrypt;
import kr.co.sist.util.cipher.DataEncrypt;

public class LoginService {
	
public boolean loginProcess( LoginDTO lDTO, HttpSession session) {
	boolean flag = false;
	
	LoginDAO lDAO = LoginDAO.getInstance();
	
	try {
		//비밀번호를 일방향 해시()
		lDTO.setPass(DataEncrypt.messageDigest("SHA-256", lDTO.getPass()));
		
		LoginResultDTO lrDTO = lDAO.selectLogin(lDTO); 
		flag = lrDTO != null;//검색 결과가 있다면,,, DTO객체에 값 생성(실패 : null) //selectLogin메소드
		///이제 세션에 넣는다~~~
		///1) HttpServletRequest관점
		///2) HttpSession관점

		
		if(flag) {//로그인 성공
//			session.setAttribute("userData", lrDTO);
			///복호화 해놓을지, 쓸때하다 복호화할지 -> 용도에 따라 다르다~~
			
			//1.이름은 암호화상태,
			//2.이메일을 복호화하자(MemberService에서 대칭키 가져오자)
			String key="abcdef0123456789";//키 관리 잘해야 한다~~!
			DataDecrypt dd = new DataDecrypt(key);
		
			
			try {
				lrDTO.setName(dd.decryption(lrDTO.getName()));
				
				lrDTO.setEmail(dd.decryption(lrDTO.getEmail()));
			}catch(Exception e) {
				e.printStackTrace();
			}//end catch
			
			//3. 세션에 로그인결과를 할당한다~~
			session.setAttribute("userData", lrDTO);
			
			//ex) 로그인성공했는데 복호화 안되면? 등등 catch의 형태가 달라진다!
		}//end if
	} catch (SQLException se) {
		se.printStackTrace();
	} catch (NoSuchAlgorithmException nsae) {
		nsae.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}//end catch
	
	return flag;
}//loginProcess
}//class
