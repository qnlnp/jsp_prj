package day0508;

/**
 * 
 */
public class MemberFormDTO {

	private String idInput, passInput, nameInput, birthInput;
	private String contactInput, callInput, emailLeftInput, emailRgihtInput;
	private String domain, zipcode, addr, addr2, prInput;
	
	public MemberFormDTO() {
		
	}

	public MemberFormDTO(String idInput, String passInput, String nameInput, String birthInput, String contactInput,
			String callInput, String emailLeftInput, String emailRgihtInput, String domain, String zipcode, String addr,
			String addr2, String prInput) {
		super();
		this.idInput = idInput;
		this.passInput = passInput;
		this.nameInput = nameInput;
		this.birthInput = birthInput;
		this.contactInput = contactInput;
		this.callInput = callInput;
		this.emailLeftInput = emailLeftInput;
		this.emailRgihtInput = emailRgihtInput;
		this.domain = domain;
		this.zipcode = zipcode;
		this.addr = addr;
		this.addr2 = addr2;
		this.prInput = prInput;
	}

	public String getIdInput() {
		return idInput;
	}

	public void setIdInput(String idInput) {
		this.idInput = idInput;
	}

	public String getPassInput() {
		return passInput;
	}

	public void setPassInput(String passInput) {
		this.passInput = passInput;
	}

	public String getNameInput() {
		return nameInput;
	}

	public void setNameInput(String nameInput) {
		this.nameInput = nameInput;
	}

	public String getBirthInput() {
		return birthInput;
	}

	public void setBirthInput(String birthInput) {
		this.birthInput = birthInput;
	}

	public String getContactInput() {
		return contactInput;
	}

	public void setContactInput(String contactInput) {
		this.contactInput = contactInput;
	}

	public String getCallInput() {
		return callInput;
	}

	public void setCallInput(String callInput) {
		this.callInput = callInput;
	}

	public String getEmailLeftInput() {
		return emailLeftInput;
	}

	public void setEmailLeftInput(String emailLeftInput) {
		this.emailLeftInput = emailLeftInput;
	}

	public String getEmailRgihtInput() {
		return emailRgihtInput;
	}

	public void setEmailRgihtInput(String emailRgihtInput) {
		this.emailRgihtInput = emailRgihtInput;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPrInput() {
		return prInput;
	}

	public void setPrInput(String prInput) {
		this.prInput = prInput;
	}
	
}//class

/*

inputIdParam: <%= inputIdParam%><br>
inputPassParam: <%= inputPassParam%><br>
inputNameParam: <%= inputNameParam%><br>
inputBirthParam: <%= inputBirthParam%><br>
inputContactParam: <%= inputContactParam%><br>
inputCallParam: <%= inputCallParam%><br>

inputEmailLeftParam: <%= inputEmailLeftParam%><br>
inputEmailRightParam: <%= inputEmailRightParam%><br>

inputDomainParam: <%= inputDomainParam%><br>

inputZipcodeParam: <%= inputZipcodeParam%><br>
inputAddrParam: <%= inputAddrParam%><br>
inputAddr2Param: <%= inputAddr2Param%><br>

inputPrParam: <%= inputPrParam%><br>


*/