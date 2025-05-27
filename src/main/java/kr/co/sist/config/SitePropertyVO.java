package kr.co.sist.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.co.sist.member.MemberDAO;
import lombok.Getter;

/**
 * 
 */
public class SitePropertyVO {

	private static SitePropertyVO spVO;
	
	@Getter
	private String site_name, site_version, site_info;
	@Getter
	private String protocol, server_name, server_port, servlet_path;
	@Getter
	private String logo_img, upload_path;
	
	private SitePropertyVO() {
		try {
			setConfig();//설정정보를 가져온다~~~~~~~
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
	}//SitePropertyVO

	public static SitePropertyVO getInstance() {
		if( spVO == null) {
			spVO = new SitePropertyVO();
		}//end if

		return spVO;
	}//getInstance
	
	private void setConfig() throws SQLException{
		//JDBC
		//1.드라이버로딩
		//2.커넥션얻기(DriverManager)
		
		//1.드라이버로딩
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}//end catch
		
		//DB연동 유연성
		String url="jdbc:oracle:thin:@localhost:1521:orcl";//아니면 프로퍼티로 빼던가~
		String id="scott";
		String pass="tiger";
		
		Connection con=null;
		Statement stmt=null;
		ResultSet rs = null;
		
		try {
			con=DriverManager.getConnection(url, id, pass);
			stmt=con.createStatement();
			String configSql="	select	site_name,site_version,site_info,protocol,server_name,server_port,servlet_path,logo_img,upload_path from site_property";
			rs=stmt.executeQuery(configSql);
			
			if( rs.next() ) {
				site_name=rs.getString("site_name");
				site_version=rs.getString("site_version");
				site_info=rs.getString("site_info");
				protocol=rs.getString("protocol");
				server_name=rs.getString("server_name");
				server_port=rs.getString("server_port");
				servlet_path=rs.getString("servlet_path");
				logo_img=rs.getString("logo_img");
				upload_path=rs.getString("upload_path");
			}//end if
			
			
		}finally {
			if( rs != null ) { rs.close(); };
			if( stmt != null ) { stmt.close(); };
			if( con != null ) { con.close(); };
		}//end finally
		

		
	}//setConfig
	
}//class
