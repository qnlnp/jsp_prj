package xml0528;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import day0515.Dept;
import day0515.DeptService;

/**
 * 
 */
public class CreateDeptXML {
	
	public void createDeptFile() throws IOException {
		try {
			FileOutputStream fos =
					new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml0528/db_dept.xml");
			createXML(fos, null);
			
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		}//end catch
		
	}//createDeptFile
	
	public void WebBrowserOutput(JspWriter out) throws IOException {
		createXML(null, out);
	}//WebBrowserOutput
	
	private void createXML(FileOutputStream fos, JspWriter out) throws IOException {
		DeptService ds = new DeptService();
		List<Dept> deptList = ds.searchAllDept();
		
		//1. XML문서객체를 생성한다.
		Document doc = new Document();//	<?xml version="1.0" encoding="UTF-8"?>
		//2. 최상위부모 노드(근 노드)를 생성한다.
		Element rootNode = new Element("depts");//	<depts/>
		
		//3. 부가정보 넣기
		//3-1. 부가정보를 가진 노드를 생성한다.
		//ex) result, pubDate
		Element resultNode = new Element("result");//	<result/>
		resultNode.setText(String.valueOf(!deptList.isEmpty()));
		Element pubDateNode = new Element("pubDate");//	<pubDate/>
		pubDateNode.setText(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		//3-2. 검색 정보를 가진 노드를 최상위부모 노드에 배치한다.
		rootNode.addContent(resultNode);
		rootNode.addContent(pubDateNode);
		
		/* 더 바람직한 형태는,,, 따로 빼는것,,,
			<item>
				<result>true</result>
				<pubDate>yyyy-MM-dd HH:mm:ss</pubDate>
			</item>
		*/

		//4. 조회결과로 노드를 생성하여 배치한다.
		Element deptNode=null;//하나의 레코드
		Element deptnoNode=null;//deptno 컬럼값
		Element dnameNode=null;//dname 컬럼값
		Element locNode=null;//loc 컬럼값
		
		for( Dept dept : deptList) {
			//하나의 레코드를 저장하기위한 노드
			deptNode = new Element("dept");
			//컬럼값들
			deptnoNode = new Element("deptno");
			dnameNode = new Element("dname");
			locNode = new Element("loc");
			
			//조회된 컬럼값을,,, 생성한 노드에 설정한다.
			deptnoNode.setText(String.valueOf(dept.getDeptno()));
			dnameNode.setText(dept.getDname());
			locNode.setText(dept.getLoc());
			
			//컬럼값을 가진 노드를,,, 부모노드(dept)에 배치한다.
			deptNode.addContent(deptnoNode);
			deptNode.addContent(dnameNode);
			deptNode.addContent(locNode);
			
			//dept노드를,,, depts노드에 배치한다.
			rootNode.addContent(deptNode);
		}//end for
		
		//5. 모든 레코드를 가진 rootNode를,,, XML문서객체(doc)에 배치한다.
		doc.addContent(rootNode);
		
		//6. 출력한다.
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());		
		
		if(out == null) {
			xOut.output(doc, fos);//파일로 출력
		}else {
			xOut.output(doc, out);//브라우저로 출력
		}//end else
		
	}//createXML
}//class
