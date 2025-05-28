package day0515;

import java.io.FileWriter;
import java.io.IOException;

/**
 * 
 */
public class CreateHTML {
//C:\dev\workspace\jsp_prj\src\main\webapp\day0515\ajax.txt

	public static void main(String[] args) {
		String msg="<strong>내이름은 주현석</strong><br>	<img src='http://192.168.10.68/jsp_prj/common/images/img_3.jpg'/>";

		try {
			FileWriter fw= new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.html");
			fw.write(msg);
			fw.flush();
			
			if( fw != null ) {fw.close();}
		} catch(IOException ie) {
			ie.printStackTrace();
		}//end catch
		
	}//main

}//class
