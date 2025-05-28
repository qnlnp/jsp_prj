package kr.co.sist.place;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.place.RestDTO;
import kr.co.sist.place.PlaceDTO;
import kr.co.sist.dao.DbConnection;

public class PlaceDAO {
	private static PlaceDAO pDAO;
	
	private PlaceDAO() {
	}//PlaceDAO
	public static PlaceDAO getInstance() {
		if( pDAO == null) {
			pDAO = new PlaceDAO();
		}//end if
		return pDAO;
			
	}//getInstance
	
	
	
	public void insertRestaurant(RestDTO rDTO) throws SQLException {
		
		DbConnection db = DbConnection.getInstance();
		
		PreparedStatement pstmt=null;
		Connection con=null;
		try {
		//1. JNDI사용객체 생성하기
		//2. DBCP에서 연결객체얻기(=DataSource)
		//3. 커넥션얻기
			con=db.getDbConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder insertRest = new StringBuilder();
			insertRest
			.append("	insert into restaurant(rest_num,restaurant,menu,price,info,lat,lng,ip,id)			")
			.append("	values(seq_rest.nextval, ?,?,?,?, ?,?,?,?)											")
			;

			pstmt=con.prepareStatement(insertRest.toString());

		//5. 바인드변수에 값할당하기
			pstmt.setString(1, rDTO.getRestaurant());
			pstmt.setString(2, rDTO.getMenu());
			pstmt.setInt(3, rDTO.getPrice());
			pstmt.setString(4, rDTO.getInfo());
			
			pstmt.setDouble(5, rDTO.getLat());
			pstmt.setDouble(6, rDTO.getLng());
			pstmt.setString(7, rDTO.getIp());
			pstmt.setString(8, rDTO.getId());

		//6. 쿼리문수행후 결과얻기
//			System.out.println(pstmt.executeUpdate()+"개의 row INSERT");
			pstmt.executeUpdate();

		} catch(Exception e){
			e.printStackTrace();
		} finally {
		//7. 연결끊기
			db.dbClose(null, pstmt, con);
		}//end finally
		
		///이제 Service가서 writeRestaurant() 만들자~

	}//insertRestaurant
	
	
	//맛집검색기능도 구현해보세요~~~~~~~~
	public int selectTotalCount(PlaceDTO rDTO) throws SQLException{
		int cnt=0;
		
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
			StringBuilder selectCount = new StringBuilder();
			selectCount
			.append("	select	count(rest_num)	cnt	")
			.append("	from	restaurant			")
			;
			
			///////////////////다이나믹 쿼리////////////////////////////////////
			
//			if( ( rDTO!=null )&&( !"".equals( rDTO.getKeyword() ) ) ){
			
			
			if(  rDTO.getKeyword() != null && !"".equals( rDTO.getKeyword() )  ){
				selectCount
				.append("	where	instr(		")
				.append(	rDTO.getFieldName()	 )
				.append("	,?) != 0			")
				;
			}//end if
			
			////////////////////////////////////////////////////////////////
		
//			System.out.println(selectIdQuery);

		//5. 바인드변수에 값할당하기
			pstmt=con.prepareStatement(selectCount.toString());
			
			if( ( rDTO.getKeyword() != null )&&( !"".equals(rDTO.getKeyword()) ) ){
			pstmt.setString(1, rDTO.getKeyword());
			}//end if
			
			System.out.println(rDTO.getFieldName());
			System.out.println(rDTO.getKeyword());
//			pstmt.setInt(1, cnt);
			
			
			
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				cnt=rs.getInt("cnt");
			}//end if
			
//			flag=rs.next();
		
			
			//이미 존재한다면 해당id굳이 가져올필요없고,,,
			//존재여부만 파악하면 되니까~
			
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return cnt;
	}//selectTotalCount
	
	
	/**
	 * 시작번호(startNum)과 끝 번호(endNum) 사이에 있는<br>
	 * 레코드을 얻는 일<br>
	 * @param rDTO
	 * @return 레코드
	 * @throws SQLException
	 */
	public List<RestDTO> selectRestaurant(PlaceDTO rDTO) throws SQLException{
		List<RestDTO> list = new ArrayList<RestDTO>();
		
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
			StringBuilder selectRestaurant = new StringBuilder();
			selectRestaurant
			//rest_num, restaurant, menu, input_date(나머지는 detail에서 보여주자~~)
			
			.append("	select	rest_num,	restaurant,	menu,	input_date,	id	")
			.append("	from	(select	rest_num,	restaurant,	menu,	input_date,	id,	")
			.append("	row_number()	over	(	order	by	input_date	desc	)	rnum")
			.append("	from 	restaurant	");
			
			if(rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				selectRestaurant.append(" where instr(").append(rDTO.getFieldName()).append(", ?) != 0 ");
			}//end if
			
			selectRestaurant.append(" )	where	rnum	between	?	and	?	")
			;
			
			pstmt=con.prepareStatement(selectRestaurant.toString());
		//5. 바인드변수에 값할당하기

			int bindInd=1;
			if(rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				pstmt.setString(bindInd++, rDTO.getKeyword());
			}//end if
			
			pstmt.setInt(bindInd++,  rDTO.getStartNum());
			pstmt.setInt(bindInd++,  rDTO.getEndNum());
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();

			RestDTO restDTO=null;
			/*
			rest_num,	restaurant,	menu,	input_date,	id
			*/
			
			
			while(rs.next()) {
				restDTO=new RestDTO();
				
				restDTO.setRest_num(rs.getInt("rest_num"));
				restDTO.setRestaurant(rs.getString("restaurant"));
				restDTO.setMenu(rs.getString("menu"));
				restDTO.setInput_date(rs.getDate("input_date"));
				restDTO.setId(rs.getString("id"));
				
				list.add(restDTO);
			}//end while
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
		
	}//selectRestaurant
	
	///이제 Service클래스로 가서,,, ,,,

	
	
	
	
	
	public RestDTO selectOneRestaurant( int rest_num ) throws SQLException{
		RestDTO restDTO=null;
		
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
			StringBuilder selectOneRest = new StringBuilder();
			selectOneRest
			.append("	select	restaurant, menu, price, info, id, input_date,	lat,lng	")
			.append("	from	restaurant									")
			.append("	where	rest_num=?									")
			;
			
		//5. 바인드변수에 값할당하기
			pstmt=con.prepareStatement(selectOneRest.toString());
			pstmt.setInt(1, rest_num);
			
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();
			
			if(rs.next()){//검색결과 있으면,,,
				restDTO=new RestDTO();
//				restDTO.setRest_num(rest_num);//파라미터들어오는거로 넣어도되고,,,
				
				restDTO.setRestaurant(rs.getString("restaurant"));
				restDTO.setMenu(rs.getString("menu"));
				restDTO.setPrice(rs.getInt("price"));//자리수 적용해주면 더 좋다~~~
				restDTO.setInfo(rs.getString("info"));
				restDTO.setId(rs.getString("id"));
				restDTO.setInput_date(rs.getDate("input_date"));
				restDTO.setLat(rs.getDouble("lat"));
				restDTO.setLng(rs.getDouble("lng"));
				
				
				
				/* 
				
				//윈도우에서만 이렇게~(리눅스는 안된다)
//				bDTO.setContent(rs.getString("content"));
				//CLOB은 아주 긴 문자열을 저장하므로,,,
				//별도의 스트림연결이 필요하다~~~~~~~~~~~
				StringBuilder tempContent = new StringBuilder();
				String lineData="";
				
//				BufferedReader br=null;
//				br= new BufferedReader(rs.getClob("content").getCharacterStream());
				//finally안쓰고 연결알아서 끊어지게하려고~
				
				//////////////////////////////
				
				Clob clob=rs.getClob("content");
				if(clob != null) {
	
				//////////////////////////////
				
				
				try(BufferedReader br= new BufferedReader(rs.getClob("content").getCharacterStream())) {
					while( (lineData=br.readLine()) != null) {
						tempContent.append(lineData).append("\n");
					}//while
				} catch (IOException ie) {
					ie.printStackTrace();
					tempContent.append("글 내용 읽기 실패!!!!!!!!!");
				}//end catch
				
				bDTO.setContent(tempContent.toString());
				}//end if(clob이 null인지 먼저 해주자~)
				
				 */
				
				
			}//end if
				
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return restDTO;
	}//selectOneRestaurant
	
	
	
	
	
}//class
