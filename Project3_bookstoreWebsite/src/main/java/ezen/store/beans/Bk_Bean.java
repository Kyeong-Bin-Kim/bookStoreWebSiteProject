package ezen.store.beans;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.springframework.web.multipart.MultipartFile;

public class Bk_Bean {
	
	@Min(00000001)
	@Digits(fraction = 0, integer = 8)
	private int bk_number;
	
	@Size(min=1, max=150)
	@Pattern(regexp = "[a-zsA-Z가-힣]*")
	private String bk_title;
	
	@Size(min=1, max=90)
	@Pattern(regexp = "[a-zA-Z가-힣]*")
	private String bk_writer;
	
	@Size(min=1, max=60)
	@Pattern(regexp = "[a-zA-Z가-힣]*")
	private String bk_publisher;
	
	@NotBlank
	@Pattern(regexp = "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$")
	private String bk_pubdate;
	
	private String bk_image;
	
	//upload
	private MultipartFile upload_file;
	private String bk_local;
	private String bk_genre;
	private String bk_infodate;
	
	@Size(min=1, max=1500)
	@NotNull
	private String bk_detail;
	
	@Max(1000000000)
	private int bk_quantity;
	
	@Max(1000000000)
	private int bk_price;
	
	private String bk_title_upper;
	
	private String bk_deleted;
	
	private boolean bk_numExist;
	
	private double avg_score;
	
	public Bk_Bean() {
		this.bk_numExist = false;
	}

	public int getBk_number() {
		return bk_number;
	}
	public void setBk_number(int bk_number) {
		this.bk_number = bk_number;
	}
	public String getBk_title() {
		return bk_title;
	}
	public void setBk_title(String bk_title) {
		this.bk_title = bk_title;
	}
	public String getBk_writer() {
		return bk_writer;
	}
	public void setBk_writer(String bk_writer) {
		this.bk_writer = bk_writer;
	}
	public String getBk_publisher() {
		return bk_publisher;
	}
	public void setBk_publisher(String bk_publisher) {
		this.bk_publisher = bk_publisher;
	}
	public String getBk_pubdate() {
		return bk_pubdate;
	}
	public void setBk_pubdate(String bk_pubdate) {
		this.bk_pubdate = bk_pubdate;
	}	
	public String getBk_image() {
		return bk_image;
	}
	public void setBk_image(String bk_image) {
		this.bk_image = bk_image;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public String getBk_local() {
		return bk_local;
	}
	public void setBk_local(String bk_local) {
		this.bk_local = bk_local;
	}
	public String getBk_genre() {
		return bk_genre;
	}
	public void setBk_genre(String bk_genre) {
		this.bk_genre = bk_genre;
	}
	public String getBk_infodate() {
		return bk_infodate;
	}
	public void setBk_infodate(String bk_infodate) {
		this.bk_infodate = bk_infodate;
	}
	public String getBk_detail() {
		return bk_detail;
	}
	public void setBk_detail(String bk_detail) {
		this.bk_detail = bk_detail;
	}
	public int getBk_quantity() {
		return bk_quantity;
	}
	public void setBk_quantity(int bk_quantity) {
		this.bk_quantity = bk_quantity;
	}
	public int getBk_price() {
		return bk_price;
	}
	public void setBk_price(int bk_price) {
		this.bk_price = bk_price;
	}
	public String getBk_title_upper() {
		return bk_title_upper;
	}
	public void setBk_title_upper(String bk_title_upper) {
		this.bk_title_upper = bk_title_upper;
	}	
	public String getBk_deleted() {
		return bk_deleted;
	}
	public void setBk_deleted(String bk_deleted) {
		this.bk_deleted = bk_deleted;
	}
	public boolean isBk_numExist() {
		return bk_numExist;
	}
	public void setBk_numExist(boolean bk_numExist) {
		this.bk_numExist = bk_numExist;
	}

	public double getAvg_score() {
		return avg_score;
	}

	public double setAvg_score(double avg_score) {
		return this.avg_score = avg_score;
	}

	
}
