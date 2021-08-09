package com.model;

public class MarketDTO {
	
	private int product_num;
	private String product;
	private String product_title;
	private String product_con;
	private String product_pic;
	private String product_price;
	private String product_seller;
	
	
	public MarketDTO(int product_num, String product, String product_title, String product_con, String product_pic,
			String product_price, String product_seller) {
		super();
		this.product_num = product_num;
		this.product = product;
		this.product_title = product_title;
		this.product_con = product_con;
		this.product_pic = product_pic;
		this.product_price = product_price;
		this.product_seller = product_seller;
	}


	public MarketDTO(String product, String product_title, String product_con, String product_pic, String product_price,
			String product_seller) {
		super();
		this.product = product;
		this.product_title = product_title;
		this.product_con = product_con;
		this.product_pic = product_pic;
		this.product_price = product_price;
		this.product_seller = product_seller;
	}


	public String getproduct_seller() {
		return product_seller;
	}


	public void setproduct_seller(String product_seller) {
		this.product_seller = product_seller;
	}


	public String getproduct() {
		return product;
	}


	public void setproduct(String product) {
		this.product = product;
	}


	public String getproduct_title() {
		return product_title;
	}


	public void setproduct_title(String product_title) {
		this.product_title = product_title;
	}


	public String getproduct_con() {
		return product_con;
	}


	public void setproduct_con(String product_con) {
		this.product_con = product_con;
	}


	public String getproduct_pic() {
		return product_pic;
	}


	public void setproduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}


	public String getproduct_price() {
		return product_price;
	}


	public void setproduct_price(String product_price) {
		this.product_price = product_price;
	}

	public MarketDTO(int product_num, String product, String product_title, String product_con, String product_pic,
			String product_price) {
		super();
		this.product_num = product_num;
		this.product = product;
		this.product_title = product_title;
		this.product_con = product_con;
		this.product_pic = product_pic;
		this.product_price = product_price;
	}

	public int getproduct_num() {
		return product_num;
	}

	public void setproduct_num(int product_num) {
		this.product_num = product_num;
	}



	

	

	
}
