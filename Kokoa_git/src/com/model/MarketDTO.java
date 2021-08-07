package com.model;

public class MarketDTO {
	
	private int product_num;
	private String product;
	private String product_title;
	private String product_con;
	private String product_pic;
	private String product_price;
	
	public MarketDTO(String product, String product_title, String product_con, String product_pic,
			String product_price) {
		super();
		this.product = product;
		this.product_title = product_title;
		this.product_con = product_con;
		this.product_pic = product_pic;
		this.product_price = product_price;
	}
	
	public String getProduct() {
		return product;
	}


	public void setProduct(String product) {
		this.product = product;
	}


	public String getProduct_title() {
		return product_title;
	}


	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}


	public String getProduct_con() {
		return product_con;
	}


	public void setProduct_con(String product_con) {
		this.product_con = product_con;
	}


	public String getProduct_pic() {
		return product_pic;
	}


	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}


	public String getProduct_price() {
		return product_price;
	}


	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}



	
}
