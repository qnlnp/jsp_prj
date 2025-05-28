package day0508;

/**
 * useBean 표준액션에 사용해볼 DTO 
 */
public class DataDTO {
	
	private String name;
	private int myAge;
	
	public DataDTO() {
		System.out.println("DataDTO 기본생성자 호출");
	}
	public DataDTO(String name, int myAge) {
		this.name = name;
		this.myAge = myAge;
		System.out.println("DataDTO 매개변수있는 생성자 호출");
	}
	public String getName() {
		System.out.println("getName() 호출");
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMyAge() {
		System.out.println("getMyAge() 호출");
		return myAge;
	}
	public void setMyAge(int myAge) {
		this.myAge = myAge;
	}
	@Override
	public String toString() {
		return "DataDTO [name=" + name + ", myAge=" + myAge + "]";
	}

}//class
