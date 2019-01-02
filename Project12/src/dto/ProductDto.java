package dto;



public class ProductDto {	
	private int no;
	private String name;
	private int price;
	private int stock;
	private String image;
	private int bestCount;
	private String pa_category;
	private int ch_category;
	private String content;
	private String id;
	private boolean sale;
	
	
	
	public boolean isSale() {
		return sale;
	}
	public void setSale(boolean sale) {
		this.sale = sale;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getBestCount() {
		return bestCount;
	}
	public void setBestCount(int bestCount) {
		this.bestCount = bestCount;
	}
	public String getPa_category() {
		return pa_category;
	}
	public void setPa_category(String pa_category) {
		this.pa_category = pa_category;
	}
	public int getCh_category() {
		return ch_category;
	}
	public void setCh_category(int ch_category) {
		this.ch_category = ch_category;
	}
	
	

}
