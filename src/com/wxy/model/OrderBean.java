package com.wxy.model;

import javax.xml.crypto.Data;

public class OrderBean {
    private long ordersid;
    private int userid;
    private Data orderdate;
    private String maymode;
    private byte ispayed;
    private float totalprice;
    
	public long getOrdersid() {
		return ordersid;
	}
	public void setOrdersid(long ordersid) {
		this.ordersid = ordersid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Data getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Data orderdate) {
		this.orderdate = orderdate;
	}
	public String getMaymode() {
		return maymode;
	}
	public void setMaymode(String maymode) {
		this.maymode = maymode;
	}
	public byte getIspayed() {
		return ispayed;
	}
	public void setIspayed(byte ispayed) {
		this.ispayed = ispayed;
	}
	public float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}
}
