package day0515;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * 
 */
public class DeptService {
	public List<Dept> searchAllDept(){
		List<Dept> list = null;
		
		DeptDAO dDAO=DeptDAO.getInstance();
		try {
			list=dDAO.selectAllDept();
//			list=new ArrayList<Dept>(); //조회된 결과가 없음
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllDept
	
	
	/**
	 * 복합형태의 JSONObject을 반환하는 메서드.
	 * @return
	 */
	public String jsonObj() {
		String strJSON = "";
		
		List<Dept> list = null;
		
		DeptDAO dDAO=DeptDAO.getInstance();
		try {
			list=dDAO.selectAllDept();//0. 조회된 데이터를 기반으로,,,
			
//			///연습용~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//			if( new Random().nextBoolean()) {
//				list=new ArrayList<Dept>();
//			}
//			///연습용~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
			//1. JSONObject를 생성한다(부가적인 정보, 데이터를 가질 때 사용)
			JSONObject jsonObj = new JSONObject();
			//부가적인 정보들,,,
			jsonObj.put("resultFlag", !list.isEmpty());//검색정보가 존재하는지
			jsonObj.put("pubDate", sdf.format(new Date()));//생성될때의 시간
			jsonObj.put("dataLength", list.size());//데이터의 크기
			
			//2. 데이터 채우기
			//JSONArray 생성(데이터를 저장하려고)
			JSONArray jsonArr = new JSONArray();
			
			JSONObject jsonTemp = null; //데이터가 있으면 만들려고~~
			for( Dept deptDTO : list) {
				//DB에서 검색된 데이터로,,, JSONObject을 생성하여,,, JSONArray에 할당
				jsonTemp=new JSONObject();
				jsonTemp.put("deptno", deptDTO.getDeptno());
				jsonTemp.put("deptname", deptDTO.getDname());
				jsonTemp.put("loc", deptDTO.getLoc());
				jsonArr.add(jsonTemp);
			}//end for
			
			//JSONArray를 JSONObject에 할당하기
			jsonObj.put("data", jsonArr);
			
			//데이터와 부가적인 정보를 가진 JSONObject를 문자열로 얻기
			strJSON = jsonObj.toJSONString();

		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		
		return strJSON;
	}//jsonObj
	
}//class
