package kr.co.sist.place;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * REST아니고,,,<br>
 * 입력받을거니까 생성자도 필요없다~~<br>
 */
@Getter
@Setter
@ToString
public class RestDTO {
	private int rest_num, price;			
	private double lat, lng;
	private String restaurant, menu, info, ip, id;
	private Date input_date;
}//class