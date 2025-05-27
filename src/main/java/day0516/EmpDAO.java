package day0516;

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
public class EmpDAO {
	private static EmpDAO dDAO;
	private EmpDAO() {
		
	}//DeptDAO
	public static EmpDAO getInstance() {
		if( dDAO == null) {
			dDAO=new EmpDAO();
		}//end if
		return dDAO;
	}//getInstance
	
	/*
	public List<Dept> selectAllDept(){
		List<Dept> list = new ArrayList<Dept>();
		
		return list;
	}//selectAllDept
	*/
	
	public List<EmpDTO> selectAllEmp(int deptno) throws SQLException{
		List<EmpDTO> list = new ArrayList<EmpDTO>();
		
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
			String selectAllEmp="	select empno,ename,job,hiredate,sal	from emp where deptno= ?";
			
		//5. 바인드변수에 값할당하기
			pstmt=con.prepareStatement(selectAllEmp.toString());
			pstmt.setInt(1, deptno);
		//6. 쿼리문수행결과얻기
			
			
			
			rs=pstmt.executeQuery();
			
			EmpDTO empDTO = null;
			
			while(rs.next()) {
				empDTO= new EmpDTO();
				empDTO.setEmpno(rs.getInt("empno"));
				empDTO.setEname(rs.getString("ename"));
				empDTO.setJob(rs.getString("job"));
				empDTO.setHiredate(rs.getDate("hiredate"));
				empDTO.setSal(rs.getInt("sal"));
				list.add(empDTO);
			}//end while
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectAllDept
	

}//class
