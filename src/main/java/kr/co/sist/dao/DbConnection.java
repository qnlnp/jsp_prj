package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * 
 */
public class DbConnection {
	private static DbConnection dbCon;
	private static Context ctx;
	
	private DbConnection() {
	}//DbConnection
	
	public static DbConnection getInstance() {
		if(dbCon == null) {
			dbCon = new DbConnection();
			try {
				//1. JNDI사용객체 생성
				ctx=new InitialContext();
			} catch (NamingException ne) {
				ne.printStackTrace();
			}//end catch
		}//end if
		
		return dbCon;
	}//getInstance
	
	public Connection getDbConn() {
		Connection con=null;
	
		//2. 이름으로(JNDI),,, DBCP에서 DB를 연결하고있는 객체(DataSource)를 찾는다.
		try {
			DataSource ds= (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
			con=ds.getConnection();
		} catch (NamingException ne) { //lookup("java:comp/env/jdbc/dbcp")
			ne.printStackTrace();
		} catch (SQLException se) { //con=ds.getConnection();
			se.printStackTrace();
		}//end catch
		
		
		return con;
	}//getDbConn
	
	//리절트셋, statement,,, , 커넥션 
	public void dbClose( ResultSet rs, Statement stmt, Connection con ) 
	throws SQLException{
		try {
			if( rs != null ) { rs.close(); }; //end if
			if( stmt != null ) { stmt.close(); }; //end if
		}finally {
			if( con != null ) { con.close(); }; //end if
		}//end finally
	}//dbClose
	
}//class
