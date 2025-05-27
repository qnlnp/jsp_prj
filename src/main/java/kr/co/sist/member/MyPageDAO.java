package kr.co.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class MyPageDAO {

	private static MyPageDAO mpDAO;
	
	private MyPageDAO() {
	}//MyPageDAO
	public static MyPageDAO getInstance() {
		if( mpDAO == null) {
			mpDAO = new MyPageDAO();
		}//end if
		return mpDAO;
		
		
	}//getInstance
	
	


/**
 * mypage_index.jsp에서만 변경할 수 있는 정보들 다루려고~
 * @param mpDTO
 * @throws SQLException
 */
public void updateMember( MyPageDTO mpDTO ) throws SQLException{
		
		DbConnection db = DbConnection.getInstance();
		
		PreparedStatement pstmt=null;
		Connection con=null;
		try {
		//1. JNDI사용객체 생성하기
		//2. DBCP에서 연결객체얻기(=DataSource)
		//3. 커넥션얻기
			con=db.getDbConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder updateWebMember = new StringBuilder();
			updateWebMember
			.append("	update web_member				")
			.append("	set birth=?, tel=?	profile=?	")
			.append("	where id=?						")
			;

			pstmt=con.prepareStatement(updateWebMember.toString());

		//5. 바인드변수에 값할당하기
			pstmt.setString(1, mpDTO.getBirth());
			pstmt.setString(2, mpDTO.getTel());
			pstmt.setString(3, mpDTO.getImgName());
			pstmt.setString(4, mpDTO.getId());
			
		//6. 쿼리문수행후 결과얻기
//			System.out.println(pstmt.executeUpdate()+"개의 row INSERT");
			pstmt.executeUpdate();
			
			/*
			if(rs.next()){
				flag=true;
			}//end if
			*/ 
			
			//이미 존재한다면 해당id굳이 가져올필요없고,,,
			//존재여부만 파악하면 되니까~
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
		//7. 연결끊기
			db.dbClose(null, pstmt, con);
		}//end finally
		
	}//updateMember
	

	
}//class
