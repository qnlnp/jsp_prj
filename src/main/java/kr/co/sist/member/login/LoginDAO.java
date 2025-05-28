package kr.co.sist.member.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.member.MemberDAO;

/**
 * 
 */
public class LoginDAO {
	private static LoginDAO lDAO;
	
	private LoginDAO() {
	}//MemberDAO
	public static LoginDAO getInstance() {
		if( lDAO == null) {
			lDAO = new LoginDAO();
		}//end if
		return lDAO;
		
	}//getInstance
	
	
	public LoginResultDTO selectLogin(LoginDTO lDTO) throws SQLException{
//		boolean flag=false;
		LoginResultDTO lrDTO = null;//선언만 해주고~
		
		
		/*
		[JDBC의 경우]
		1. 드라이버의 로딩(빌드 path~~)
		2. 로딩된 드라이버로,,, 커넥션 얻기
		3. 커넥션에서,,, 쿼리문 생성객체 얻기
		4. 쿼리문 실행 후 결과 얻기
		5. 연결끊기
		*/
		DbConnection db = DbConnection.getInstance();
		
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		Connection con=null;
		try {
		//1. JNDI사용객체 생성하기
		//2. DBCP에서 연결객체얻기(=DataSource)
		//3. 커넥션얻기
			con=db.getDbConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder selectLoginInfo = new StringBuilder();
			selectLoginInfo
			.append("	select	name,	email,	pass	")//파라미터의 id, db의 name,email
			.append("	from	web_member				")
			.append("	where	id=?	and	pass=?		")
			;
			
		//5. 바인드변수에 값할당하기
			pstmt=con.prepareStatement(selectLoginInfo.toString());
			pstmt.setString(1, lDTO.getId());
			pstmt.setString(2, lDTO.getPass());
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();
			/*
			if(rs.next()){
				flag=true;
			}//end if
			*/ 
			
			
			if(rs.next()) { //검색 결과가 있다면,,, DTO객체에 값 생성
				lrDTO=new LoginResultDTO();
				lrDTO.setId(lDTO.getId()); //파라미터로 들어온것 쓰려고~
				lrDTO.setName(rs.getString("name"));//name컬럼, 복호화해서 써야한다~
				lrDTO.setEmail(rs.getString("email"));//email컬럼, 복호화해서 써야한다~
				
				lrDTO.setPass(rs.getString("pass"));
			}//end if
			
			/*
			flag=rs.next();
			//이미 존재한다면 해당id굳이 가져올필요없고,,,
			//존재여부만 파악하면 되니까~
			*/
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		
		return lrDTO;
		
	}//selectId
	
	
	
}//class
