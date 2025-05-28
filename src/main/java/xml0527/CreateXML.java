package xml0527;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXML {

	public void createXML() {
		// 1. XML문서객체 생성
		Document doc = new Document();
		// <?xml version="1.0" encoding="UTF-8"?> 만든다고 생각하자~~
		// 2. 최상위부모노드 생성
		Element rootNode = new Element("root");
		// 3. 자식 노드 생성
		Element msgNode = new Element("msg");
		Element todayNode = new Element("today");

		// 자식노드에 값 설정
		// setText밖에없고, 연산안되고, String ~
//		System.out.println("msgNode: " + msgNode);
		msgNode.setText("msg노드의 내용");
		todayNode.setText("today노드의 내용");
//		System.out.println("msgNode: " + msgNode);
		
		//자식노드에 속성을 설정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//속성객체 생성
		Attribute attr = new Attribute("today", sdf.format(new Date()));
		//자식노드에 배치
		
		//자식노드를 부모노드에 배치
		rootNode.addContent( msgNode );
		rootNode.addContent( todayNode );
		
		todayNode.setAttribute(attr);
		
		doc.addContent(rootNode);
		
		//출력객체 생성
//		XMLOutputter xOut = new XMLOutputter(Format.getRawFormat());
//		XMLOutputter xOut = new XMLOutputter(Format.getCompactFormat());
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		//콘솔출력
		
		try {
			xOut.output(doc, System.out);
			xOut.output(doc, new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml0527/create.xml"));
		} catch ( IOException ie) {
			ie.printStackTrace();
		}//catch
		
	}// createXML
	
	public void createXML2(JspWriter out) {
		// 1. XML문서객체 생성
		Document doc = new Document();
		// <?xml version="1.0" encoding="UTF-8"?> 만든다고 생각하자~~
		// 2. 최상위부모노드 생성
		Element rootNode = new Element("root");
		// 3. 자식 노드 생성
		Element msgNode = new Element("msg");
		Element todayNode = new Element("today");

		// 자식노드에 값 설정
		// setText밖에없고, 연산안되고, String ~
//		System.out.println("msgNode: " + msgNode);
		msgNode.setText("msg노드의 내용");
		todayNode.setText("today노드의 내용");
//		System.out.println("msgNode: " + msgNode);
		
		//자식노드에 속성을 설정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//속성객체 생성
		Attribute attr = new Attribute("today", sdf.format(new Date()));
		//자식노드에 배치
		
		//자식노드를 부모노드에 배치
		rootNode.addContent( msgNode );
		rootNode.addContent( todayNode );
		
		todayNode.setAttribute(attr);
		
		doc.addContent(rootNode);
		
		//출력객체 생성
//		XMLOutputter xOut = new XMLOutputter(Format.getRawFormat());
//		XMLOutputter xOut = new XMLOutputter(Format.getCompactFormat());
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		//콘솔출력
		
		try {
			xOut.output(doc, System.out);
			xOut.output(doc, out);
		} catch ( IOException ie) {
			ie.printStackTrace();
		}//catch
		
	}//createXML2
	


	public static void main(String[] args) {
		new CreateXML().createXML();
	}// main

}// class