package xml0528;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class DeptXMLParsing {

	public void parsing() {
		//1. XML을 로딩할수있는 객체를 생성한다.
		SAXBuilder builder = new SAXBuilder();
		//2. XML에 접근하여,,, 문서객체로 얻는다.
		Document doc=null;
		
		try {
			
		//2-1. 로컬에서 얻는 경우
		doc = builder.build(new File("C:/dev/workspace/jsp_prj/src/main/webapp/xml0528/db_dept.xml"));
		//2-2. 웹에서 얻는 경우
//		doc = builder.build(new URL("http://192.168.10.88/jsp_prj/xml0528/db_dept.xml"));
		
		//최상위부모 노드 얻기(root는 하나니까 이름몰라도 가져올 수 있다)
		Element rootNode = doc.getRootElement();
		System.out.println("rootNode: "+rootNode);
//		System.out.println( doc );
		
		//정보를 제공하는 특정자식 노드 얻기
		Element resultNode=rootNode.getChild("result");
		System.out.println("resultNode: "+resultNode);
		System.out.println("result: "+resultNode.getText());
		
		Element pubDateNode=rootNode.getChild("pubDate");
		String pubDate=pubDateNode.getText();
		System.out.println("pubDateNode: "+pubDateNode);
		System.out.println("pubDate: "+pubDate);
		
		Boolean flag=Boolean.valueOf(resultNode.getText());
		System.out.println("---------------------------------------------------");
		System.out.println("flag: "+flag);
		
		if( flag ) {
			//여러 자식노드를 가진,,, 반복되는 노드 얻기
//			List<Element> deptList = new ArrayList<Element>();
			List<Element> deptList = rootNode.getChildren("dept");
			
			Element deptnoNode=null;
			Element dnameNode=null;
			Element locNode=null;
			
			for( Element deptNode : deptList ) {
				//파싱할,,, 자식노드 얻기
				deptnoNode=deptNode.getChild("deptno");
				dnameNode=deptNode.getChild("dname");
				locNode=deptNode.getChild("loc");
				System.out.println(deptnoNode.getText()+"/"+dnameNode.getText()+"/"+locNode.getText());
			}//end for
			
		}//end if
		
		} catch (JDOMException je) {
			je.printStackTrace();
		} catch (IOException ie) {
			ie.printStackTrace();
		}//end catch
		
	}//parsing
	
	public static void main(String[] args) {
		DeptXMLParsing dxp = new DeptXMLParsing();
		dxp.parsing();
	}//main
	
}//class
