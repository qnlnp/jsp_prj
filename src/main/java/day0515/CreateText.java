package day0515;

import java.io.FileWriter;
import java.io.IOException;

/**
 * 
 */
public class CreateText {
//C:\dev\workspace\jsp_prj\src\main\webapp\day0515\ajax.txt

	public static void main(String[] args) {
		String msg="after CreateText.java";
		try {
			FileWriter fw= new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.txt");
			fw.write(msg);
			fw.flush();
			
			if( fw != null ) {fw.close();}
		} catch(IOException ie) {
			ie.printStackTrace();
		}//end catch
		
	}//main

}//class
