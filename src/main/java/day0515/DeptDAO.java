package day0515;

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
public class DeptDAO {
	private static DeptDAO dDAO;
	private DeptDAO() {
		
	}//DeptDAO
	public static DeptDAO getInstance() {
		if( dDAO == null) {
			dDAO=new DeptDAO();
		}//end if
		return dDAO;
	}//getInstance
	
	/*
	public List<Dept> selectAllDept(){
		List<Dept> list = new ArrayList<Dept>();
		
		return list;
	}//selectAllDept
	*/
	
	public List<Dept> selectAllDept() throws SQLException{
		List<Dept> list = new ArrayList<Dept>();
		
		//1. JNDI사용객체 만들기
		//2. DBCP에서 DataSource 얻기
		//3. 커넥션 얻기
		//4. 쿼리문생성객체 얻기
		//5. 바인드변수에 값할당하기
		//6. 쿼리문수행결과얻기
		//7. 연결끊기!!!!!!!
		
		DbConnection dbCon = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. JNDI사용객체 만들기
		//2. DBCP에서 DataSource 얻기
		//3. 커넥션 얻기
			con=dbCon.getDbConn();
		//4. 쿼리문생성객체 얻기
			String selectAllDept="	select deptno,dname,loc from dept";
		//5. 바인드변수에 값할당하기
		//6. 쿼리문수행결과얻기
			pstmt=con.prepareStatement(selectAllDept);
			
			rs=pstmt.executeQuery();
			Dept deptDTO=null;
			while(rs.next()) {
				deptDTO = new Dept(
						rs.getInt("deptno"),
						rs.getString("dname"),
						rs.getString("loc")
						);
				list.add(deptDTO);
			}//end while
		}finally {
			
		}//end finally
		
		return list;
	}//selectAllDept
	

}//class
