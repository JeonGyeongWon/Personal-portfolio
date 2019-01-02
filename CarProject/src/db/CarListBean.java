package db;

//나중에 join으로 뿌려줌
public class CarListBean { // DTO

	private int carno;
	private String carname;
	private String carcompany;
	private int carprice;
	private int carusepeople;
	private String carinfo;
	private String carimg;
	private String carcategory;

	// getter, setter메소드
	public int getCarno() {
		return carno;
	}

	public void setCarno(int carno) {
		this.carno = carno;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public String getCarcompany() {
		return carcompany;
	}

	public void setCarcompany(String carcompany) {
		this.carcompany = carcompany;
	}

	public int getCarprice() {
		return carprice;
	}

	public void setCarprice(int carprice) {
		this.carprice = carprice;
	}

	public int getCarusepeople() {
		return carusepeople;
	}

	public void setCarusepeople(int carusepeople) {
		this.carusepeople = carusepeople;
	}

	public String getCarinfo() {
		return carinfo;
	}

	public void setCarinfo(String carinfo) {
		this.carinfo = carinfo;
	}

	public String getCarimg() {
		return carimg;
	}

	public void setCarimg(String carimg) {
		this.carimg = carimg;
	}

	public String getCarcategory() {
		return carcategory;
	}

	public void setCarcategory(String carcategory) {
		this.carcategory = carcategory;
	}

}
