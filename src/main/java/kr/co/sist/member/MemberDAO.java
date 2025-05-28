package kr.co.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

/**
 * 
 */
public class MemberDAO {
	private static MemberDAO mDAO;
	
	private MemberDAO() {
	}//MemberDAO
	public static MemberDAO getInstance() {
		if( mDAO == null) {
			mDAO = new MemberDAO();
		}//end if
		return mDAO;
		
		
	}//getInstance
	
	/**
	 * 입력받은 아이디를 검색하는 일을 하는 메소드<br>
	 * @param id (사용가능한지,,,) 검색할 아이디
	 * @return 검색된 아이디
	 * @throws SQLException
	 */
	public boolean selectId(String id) throws SQLException{
		boolean flag=false;
		
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
			StringBuilder selectIdQuery = new StringBuilder();
			selectIdQuery
			.append("	select	id			")
			.append("	from	web_member	")
			.append("	where	id=?		")
			;
			
		//5. 바인드변수에 값할당하기
			pstmt=con.prepareStatement(selectIdQuery.toString());
			pstmt.setString(1, id);
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();
			/*
			if(rs.next()){
				flag=true;
			}//end if
			*/ 
			flag=rs.next();
			//이미 존재한다면 해당id굳이 가져올필요없고,,,
			//존재여부만 파악하면 되니까~
			
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		
		return flag;
		
	}//selectId
	
	
	
	public void insertMember( MemberDTO mDTO ) throws SQLException{
		
		
		DbConnection db = DbConnection.getInstance();
		
		PreparedStatement pstmt=null;
		Connection con=null;
		try {
		//1. JNDI사용객체 생성하기
		//2. DBCP에서 연결객체얻기(=DataSource)
		//3. 커넥션얻기
			con=db.getDbConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder insertWebMember = new StringBuilder();
			insertWebMember
			.append("	insert	into	web_member			")
			.append("	(ID, PASS, NAME, BIRTH, TEL, EMAIL, GENDER, ZIPCODE, ADDR, ADDR2, INTRO, IP)	")
			.append("	values( ?,?,?,?, ?,?,?,?, ?,?,?,?)		")
			;

			pstmt=con.prepareStatement(insertWebMember.toString());

		//5. 바인드변수에 값할당하기
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setString(4, mDTO.getBirth());
			
			pstmt.setString(5, mDTO.getTel());
			pstmt.setString(6, mDTO.getUseEmail());
			pstmt.setString(7, mDTO.getGender());
			pstmt.setString(8, mDTO.getZipcode());
			
			pstmt.setString(9, mDTO.getAddr());
			pstmt.setString(10, mDTO.getAddr2());
			pstmt.setString(11, mDTO.getIntro());
			pstmt.setString(12, mDTO.getIp());
			
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
		
	}//insertMember
	
	
	
	
	public MemberDTO selectOneMember(String id) throws SQLException{
//		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		MemberDTO mDTO = null;
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
			StringBuilder selectIdQuery = new StringBuilder();
			selectIdQuery
			.append("	select	name,birth,tel,gender,ip,input_date,profile")
			.append("	from	web_member									")
			.append("	where id=?								")
			;
			pstmt=con.prepareStatement(selectIdQuery.toString());
		//5. 바인드변수에 값할당하기
			pstmt.setString(1, id);
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();

		
			if(rs.next()) {
				mDTO = new MemberDTO();
				mDTO.setName(rs.getString("name"));
				mDTO.setBirth(rs.getString("birth"));
				mDTO.setTel(rs.getString("tel"));
				mDTO.setGender(rs.getString("gender"));
				mDTO.setIp(rs.getString("ip"));
				mDTO.setInput_date(rs.getDate("input_date"));
				mDTO.setProfile(rs.getString("profile"));
				
//				list.add(mDTO);
			}//end while
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return mDTO;
	}//selectAllMember
	
	
	
	
	
	public List<MemberDTO> selectAllMember() throws SQLException{
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
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
			StringBuilder selectIdQuery = new StringBuilder();
			selectIdQuery
			.append("	select	id,name,birth,tel,email,gender,input_date	")
			.append("	from	web_member									")
			;
			
			pstmt=con.prepareStatement(selectIdQuery.toString());
		//5. 바인드변수에 값할당하기
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();

			MemberDTO mDTO = null;
			while(rs.next()) {
				mDTO = new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setName(rs.getString("name"));
				mDTO.setBirth(rs.getString("birth"));
				mDTO.setTel(rs.getString("tel"));
				mDTO.setUseEmail(rs.getString("email")); //일관성을 유지하는 것 중요하다.
				mDTO.setGender(rs.getString("gender"));
				mDTO.setInput_date(rs.getDate("input_date"));
				
				list.add(mDTO);
			}//end while
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectAllMember

}//class
