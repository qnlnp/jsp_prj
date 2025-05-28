package day0508;

/**
 * 웹페이지에 몇명이 들어왔는지 체크하는 클래스
 */
public class Counter {
	private int cnt;//인스턴스 default value로 자동 초기화

	public Counter() {
		System.out.println("Counter 생성!!");
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}
	
	

}//class
