package sist.com.bean;

public class ProductBean {
private int    no;
private String productName;
private String productOrigin;
private int    productPrice;
private String productCategory;
private String fileName;
private String regdate;
private String id;


public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public String getProductOrigin() {
	return productOrigin;
}
public void setProductOrigin(String productOrigin) {
	this.productOrigin = productOrigin;
}
public int getProductPrice() {
	return productPrice;
}
public void setProductPrice(int productPrice) {
	this.productPrice = productPrice;
}
public String getProductCategory() {
	return productCategory;
}
public void setProductCategory(String productCategory) {
	this.productCategory = productCategory;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}

@Override
public String toString() {
	return "ProductBean [no=" + no + ", productName=" + productName + ", productOrigin=" + productOrigin
			+ ", productPrice=" + productPrice + ", productCategory=" + productCategory + ", fileName=" + fileName
			+ ", regdate=" + regdate + ", id=" + id + "]";
}

}
