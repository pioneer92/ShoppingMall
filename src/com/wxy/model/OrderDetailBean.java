package com.wxy.model;

public class OrderDetailBean {
	private long ordersid;
	private long goodsId;
	private int numbers;
	
	public long getOrdersid() {
		return ordersid;
	}
	public void setOrdersid(long ordersid) {
		this.ordersid = ordersid;
	}
	public long getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(long goodsId) {
		this.goodsId = goodsId;
	}
	public int getNumbers() {
		return numbers;
	}
	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}
}
