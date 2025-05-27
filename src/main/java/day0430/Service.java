package day0430;

import java.util.ArrayList;
import java.util.List;

public class Service {
	
	public String name() {
		return "강태일";
	}//name
	
	public List<DataDTO> subject(){
		
		List<DataDTO> list = new ArrayList<DataDTO>();
		
		list.add(new DataDTO(1, "JavaSE"));
		list.add(new DataDTO(2, "OracleDBMS"));
		list.add(new DataDTO(3, "JDBC"));
		list.add(new DataDTO(4, "HTML"));
		list.add(new DataDTO(5, "CSS"));
		
		return list;
	}//subject
	
}//class
