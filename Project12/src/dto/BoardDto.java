package dto;

import java.sql.Timestamp;

public class BoardDto {

	
	private int no;		//보드번호 primary key
	private String id;	//작성한 사용자의 아이디UserDto의 id값과 동일
	private String subject; //제목
	private String content; //내용
	private int count;
	private String ip;
	private Timestamp regdate;
	private int re_group;	//답변달기 그룹
	private int re_seq;	//답변달기 그룹내 정렬순서
	private int depth;	//들여쓰기 정렬
	private int bestCount; // 베스트
	private String file; //파일경로
	private String filename;
	
	
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getRe_group() {
		return re_group;
	}
	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getBestCount() {
		return bestCount;
	}
	public void setBestCount(int bestCount) {
		this.bestCount = bestCount;
	}
	
}
