package com.model;

public class MarketDTO {
	
	private int product_num;
	private String product;
	private String product_title;
	private String product_con;
	private String product_pic;
	private String product_price;
	
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
	
}
