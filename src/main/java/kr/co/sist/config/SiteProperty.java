package kr.co.sist.config;

import lombok.Getter;

/**
 * 
 */
public class SiteProperty {
	
	/* 인스턴스 안쓸거면 static 관점도 가능하다~
	private static SiteProperty sp;
	
	private SiteProperty() {
		
	}//SiteProperty
	
	public static SiteProperty getInstance() {
		
		if( sp == null) {
			sp=new SiteProperty();
			
		}//end if
		return sp;
	}//getInstance
	*/
	
	private static SitePropertyVO sVO = SitePropertyVO.getInstance();

	private SiteProperty() {
		
	}

	/* Ctrl+Shift+ X or Y*/							//봐서 모를것같으면 주석 해주기~~
	public static String SITE_NAME=sVO.getSite_name();//사이트명
	public static String SITE_VERSION=sVO.getSite_version();
	public static String SITE_INFO=sVO.getSite_info();
	public static String PROTOCOL=sVO.getProtocol();
	public static String SERVER_NAME=sVO.getServer_name();
	public static String SERVER_PORT=sVO.getServer_port();
	public static String SERVLET_PATH=sVO.getServlet_path();
	public static String LOGO_IMG=sVO.getLogo_img();
	public static String UPLOAD_PATH=sVO.getUpload_path();
	
	
	
	
	
}//class
