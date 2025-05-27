package day0512;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * day0512/product.jsp에서 사용할 DTO클래스
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProductDTO {
	private int num;
	private String code;
	private String prd;
	private String img;
	private int price;
	private Date date;
	
}//class
