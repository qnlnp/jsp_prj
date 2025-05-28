package kr.co.sist.util;

/**
 * 
 */
public class MyUtil {

	/**
	 * 이 메소드는 &lt;input type="radio"를 사용자 원하는 개수로 만드는 일을 한다.<br>
	 * 사용법)<br>
	 * MyUtil.createRadioTool(name, radioIndex, radioCnt, flagNum)
	 * @param name 라디오버튼의 이름
	 * @param radioIndex 라디오버튼의 인덱스
	 * @param radioCnt 생성할 라디오버튼의 개수
	 * @param flagNum checked할 라디오의 순서
	 * @return 이쁘게 생성된 HTML Form Control
	 */
	/*private String createRadioTool(String name, int radioIndex, int radioCnt, int flagNum){*/
	public static String createRadio(String name, int radioIndex, int radioCnt, int flagNum){
		
		if(radioCnt>100){
			radioCnt=100;
		}//end if
	
		if( flagNum <0 || radioCnt < flagNum ){
			flagNum=0;
		}//end if
	
		StringBuilder sbTemp = new StringBuilder();
		
		for(int i=0; i<radioCnt+1; i++){
			sbTemp.append("<input type='radio' name='").append(name).append("_").append(radioIndex).append("'")
			.append( i == flagNum ?" checked='checked'":"")
			.append(">").append(i).append(" ");
		}//end if
		
		return sbTemp.toString(); 
	}//createRadioTool
	
}//class
