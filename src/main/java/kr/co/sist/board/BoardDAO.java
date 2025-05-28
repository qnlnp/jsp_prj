package kr.co.sist.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.member.MemberDTO;

public class BoardDAO {

private static BoardDAO bDAO;
	
	private BoardDAO() {
	}//MemberDAO
	public static BoardDAO getInstance() {
		if( bDAO == null) {
			bDAO = new BoardDAO();
		}//end if
		return bDAO;
			
	}//getInstance
	
	
	public int selectTotalCount(RangeDTO rDTO) throws SQLException{
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
			StringBuilder selectIdQuery = new StringBuilder();
			selectIdQuery
			.append("	select	count(num)	cnt	")
			.append("	from	board			")
			;
			
			///////////////////다이나믹 쿼리////////////////////////////////////
			
//			if( ( rDTO!=null )&&( !"".equals( rDTO.getKeyword() ) ) ){
			
			
			if(  rDTO.getKeyword() != null && !"".equals( rDTO.getKeyword() )  ){
				selectIdQuery
				.append("	where	instr(		")
				.append(	rDTO.getFieldName()	 )
				.append("	,?) != 0			")
				;
			}//end if
			
			////////////////////////////////////////////////////////////////
		
//			System.out.println(selectIdQuery);

		//5. 바인드변수에 값할당하기
			pstmt=con.prepareStatement(selectIdQuery.toString());
			
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
	public List<BoardDTO> selecBoard(RangeDTO rDTO) throws SQLException{
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
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
			StringBuilder selectBoard = new StringBuilder();
			selectBoard
			.append("	select	num,	subject,	id,	input_date,	cnt						")
			.append("	from	(select	num,	subject,	id,	input_date,	cnt,			")
			.append("	row_number()	over	(	order	by	input_date	desc	)	rnum")
			.append("	from 	board														");
			
			if(rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				selectBoard.append(" where instr(").append(rDTO.getFieldName()).append(", ?) != 0 ");
			}
			
			selectBoard.append(" )	where	rnum	between	?	and	?	")
			;
			
			/*
			select num,subject,id,input_date,cnt
			from (select num,subject,id,input_date,cnt,
			row_number() over(order by input_date desc) rnum
			from board)
			where rnum between 1 and 10;
			*/
			
			
			pstmt=con.prepareStatement(selectBoard.toString());
		//5. 바인드변수에 값할당하기
			int bindInd=1;
			if(rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				pstmt.setString(bindInd++, rDTO.getKeyword());
			}//end if
			
			pstmt.setInt(bindInd++,  rDTO.getStartNum());
			pstmt.setInt(bindInd++,  rDTO.getEndNum());
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();

			BoardDTO bDTO=null;
			while(rs.next()) {
				bDTO=new BoardDTO();
				
				bDTO.setNum(rs.getInt("num"));
				bDTO.setCnt(rs.getInt("cnt"));
				
				bDTO.setSubject(rs.getString("subject"));
				bDTO.setId(rs.getString("id"));
				
				bDTO.setInput_date(rs.getDate("input_date"));
				
				list.add(bDTO);
			}//end while
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selecBoard
	
	
	///이제 Service클래스로 가서,,, ,,,
	
	public void insertBoard(BoardDTO bDTO) throws SQLException {
		
		DbConnection db = DbConnection.getInstance();
		
		PreparedStatement pstmt=null;
		Connection con=null;
		try {
		//1. JNDI사용객체 생성하기
		//2. DBCP에서 연결객체얻기(=DataSource)
		//3. 커넥션얻기
			con=db.getDbConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder insertBoard = new StringBuilder();
			insertBoard
			.append("	insert into board(num,subject,content,id,ip)			")
			.append("	values(seq_board.nextval,?,?,?,?)	")
			;

			/*
			insert into board(num,subject,content,id,ip)
			values(seq_board.nextval, '오늘은 월요일16','피곤스16','lee12345','192.168.10.88');
			*/ 
			
			pstmt=con.prepareStatement(insertBoard.toString());

		//5. 바인드변수에 값할당하기
			pstmt.setString(1, bDTO.getSubject());
			pstmt.setString(2, bDTO.getContent());
			pstmt.setString(3, bDTO.getId());
			pstmt.setString(4, bDTO.getIp());
		
			
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
		
		///이제 Service가서 writeBoard() 만들자~

	}//insertBoard
	
	public BoardDTO selectOneBoard( int num ) throws SQLException{
		BoardDTO bDTO=null;
		
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
			StringBuilder selectOneBoard = new StringBuilder();
			selectOneBoard
			.append("	select	subject,content,id,input_date,ip,cnt	")
			.append("	from	board									")
			.append("	where	num=?									")
			;
			
		//5. 바인드변수에 값할당하기
			pstmt=con.prepareStatement(selectOneBoard.toString());
			pstmt.setInt(1, num);
			
		//6. 쿼리문수행후 결과얻기
			rs=pstmt.executeQuery();
			
			if(rs.next()){//검색결과 있으면,,,
				bDTO=new BoardDTO();
				bDTO.setNum(num);
				bDTO.setSubject(rs.getString("subject"));
				bDTO.setId(rs.getString("id"));
				bDTO.setIp(rs.getString("ip"));
				bDTO.setInput_date(rs.getDate("input_date"));
				bDTO.setCnt(rs.getInt("cnt"));
				
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
				

			}//end if
				
			
//			flag=rs.next();
		
			
			//이미 존재한다면 해당id굳이 가져올필요없고,,,
			//존재여부만 파악하면 되니까~
			
		} finally {
		//7. 연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		
		return bDTO;
		
		//Service가자~(searchOneBoard() )
	}//selectOneBoard
	
	
	/**
	 * 조회수를 변경한다
	 * @param num 해당 게시글
	 * @return
	 * @throws SQLException
	 */
	public int updateCnt(int num) throws SQLException{
		int rowCnt=0;//변경된 행 수 반환
		
		DbConnection db = DbConnection.getInstance();
		
		PreparedStatement pstmt=null;
		Connection con=null;
		try {
		//1. JNDI사용객체 생성하기
		//2. DBCP에서 연결객체얻기(=DataSource)
		//3. 커넥션얻기
			con=db.getDbConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder updateCnt = new StringBuilder();
			updateCnt
			.append("	update	board	set	cnt=cnt+1	")
			.append("	where	num=?					")
			;

			/*
			insert into board(num,subject,content,id,ip)
			values(seq_board.nextval, '오늘은 월요일16','피곤스16','lee12345','192.168.10.88');
			*/ 
			
			pstmt=con.prepareStatement(updateCnt.toString());

		//5. 바인드변수에 값할당하기
			pstmt.setInt(1, num);

		//6. 쿼리문수행후 결과얻기
//			System.out.println(pstmt.executeUpdate()+"개의 row INSERT");
//			pstmt.executeUpdate();
			rowCnt=pstmt.executeUpdate();
			
			
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
		
		
		return rowCnt;
	}//updateCnt
	
	public int deleteBoard(BoardDTO bDTO) throws SQLException{
		int deletedRowCnt=0;//행 수 반환
		
		DbConnection db = DbConnection.getInstance();
		
		PreparedStatement pstmt=null;
		Connection con=null;
		try {
		//1. JNDI사용객체 생성하기
		//2. DBCP에서 연결객체얻기(=DataSource)
		//3. 커넥션얻기
			con=db.getDbConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder deleteBoard = new StringBuilder();
			deleteBoard
			.append("	delete 	from	board		")
			.append("	where	num=?	and	id=?	")
			;

			/*
			insert into board(num,subject,content,id,ip)
			values(seq_board.nextval, '오늘은 월요일16','피곤스16','lee12345','192.168.10.88');
			*/ 
			
			pstmt=con.prepareStatement(deleteBoard.toString());
			

		//5. 바인드변수에 값할당하기
			pstmt.setInt(1, bDTO.getNum());
			pstmt.setString(2, bDTO.getId());

		//6. 쿼리문수행후 결과얻기
//			System.out.println(pstmt.executeUpdate()+"개의 row INSERT");
//			pstmt.executeUpdate();
			deletedRowCnt=pstmt.executeUpdate();
			
			
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
		
		
		return deletedRowCnt;
		
	}//deleteBoard
	
	
	public int updateBoard(BoardDTO bDTO) throws SQLException{
		int updatedRowCnt=0;//행 수 반환
		
		DbConnection db = DbConnection.getInstance();
		
		PreparedStatement pstmt=null;
		Connection con=null;
		try {
		//1. JNDI사용객체 생성하기
		//2. DBCP에서 연결객체얻기(=DataSource)
		//3. 커넥션얻기
			con=db.getDbConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder updateBoard = new StringBuilder();
			updateBoard
			.append("	update	board				")
			.append("	set	content=?				")
			.append("	where	num=?	and	id=?	")
			;

			/*
			insert into board(num,subject,content,id,ip)
			values(seq_board.nextval, '오늘은 월요일16','피곤스16','lee12345','192.168.10.88');
			*/ 
			
			pstmt=con.prepareStatement(updateBoard.toString());
			

		//5. 바인드변수에 값할당하기
			pstmt.setString(1, bDTO.getContent());
			pstmt.setInt(2, bDTO.getNum());
			pstmt.setString(3, bDTO.getId());

		//6. 쿼리문수행후 결과얻기
//			System.out.println(pstmt.executeUpdate()+"개의 row INSERT");
//			pstmt.executeUpdate();
			updatedRowCnt=pstmt.executeUpdate();
			
			
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
		
		
		return updatedRowCnt;
		
	}//updateBoard
	
	
}//class
