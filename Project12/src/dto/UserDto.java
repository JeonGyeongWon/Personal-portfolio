package dto;

public class UserDto {
	private int no;
	private String id; 
	private String name;
	private String email;
	private String phoneNumber;
	private int pSSN;
	private int aSSN;
	private String addr;
	private String pass;
	private int level;
	
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getpSSN() {
		return pSSN;
	}
	public void setpSSN(int pSSN) {
		this.pSSN = pSSN;
	}
	public int getaSSN() {
		return aSSN;
	}
	public void setaSSN(int aSSN) {
		this.aSSN = aSSN;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
}
