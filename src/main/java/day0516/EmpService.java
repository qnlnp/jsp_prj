package day0516;

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
public class EmpService {
	
	/**
	 * 복합형태의 JSONObject을 반환하는 메서드.
	 * @return
	 */
	public String searchEmp(int deptno) {
		String strJSON = "";
		
		List<EmpDTO> list = null;
		
		EmpDAO eDAO=EmpDAO.getInstance();
		try {
			list=eDAO.selectAllEmp(deptno);//0. 조회된 데이터를 기반으로,,,
				
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
			for( EmpDTO empDTO : list) {
				//DB에서 검색된 데이터로,,, JSONObject을 생성하여,,, JSONArray에 할당
				jsonTemp=new JSONObject();
				jsonTemp.put("empno", empDTO.getEmpno());
				jsonTemp.put("ename", empDTO.getEname());
				jsonTemp.put("job", empDTO.getJob());
				
				// 날짜가 아닌 숫자형태 : JSON에러, TEXT는 그대로 나온다
				//날짜를 그대로 JSONObject로 할당하면,,, 사용하는 곳에서 ERROR
//				jsonTemp.put("hiredate", empDTO.getHiredate());//불러올때까지는 문제없다~~
				jsonTemp.put("hiredate", sdf.format(empDTO.getHiredate()));//날짜를 문자열로
	
				jsonTemp.put("sal", empDTO.getSal());
			
				///이제,,, 뿌려주는 jsp작성해보자~ (emp의 hiredate 처리까지)
				
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
