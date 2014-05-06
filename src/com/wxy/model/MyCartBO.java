package com.wxy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class MyCartBO {

	private ResultSet resultSet=null;
	private Connection connection=null;
	private PreparedStatement preparedStatement=null;
	private float allPrice=0;
	
	HashMap<String, String> hashMap=new HashMap<String, String>();
	
	public String getGoodsNumById(String goodsId) {
		return hashMap.get(goodsId);
	}
	
	public float getAllPrice() {
		return allPrice;
	}
	
	public void addGoods(String goodsId,String goodsNum) {
		hashMap.put(goodsId, goodsNum);
	}
	
	public void delGoods(String goodsId) {
		hashMap.remove(goodsId);
	}
	
	public void clearGoods() {
		hashMap.clear();
	}
	
	public void updateGoods(String goodsId,String newNum) {
		hashMap.put(goodsId, newNum);
	}
	
	public ArrayList<GoodsBean> showMyCart() {
		ArrayList<GoodsBean> arrayList=new ArrayList<GoodsBean>();
		try {
			connection=new ConnDB().getConnection();
			String sql="select * from goods where goodsId in (";
			Iterator<String> iterator=hashMap.keySet().iterator();
			while (iterator.hasNext()) {
				sql+=iterator.next();
				if (iterator.hasNext()) {
					sql+=",";
				}
			}
			sql+=");";
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			allPrice=0;
			GoodsBean goodsBean;
			while(resultSet.next()){
				goodsBean=new GoodsBean();
				goodsBean.setGoodsId(resultSet.getLong(1));
				goodsBean.setGoodsName(resultSet.getString(2));
				goodsBean.setGoodsIntro(resultSet.getString(3));
				goodsBean.setGoodsPrice(resultSet.getFloat(4));
				goodsBean.setGoodsNum(resultSet.getInt(5));
				goodsBean.setPublisher(resultSet.getString(6));
				goodsBean.setPhoto(resultSet.getString(7));
				goodsBean.setType(resultSet.getString(8));
				allPrice+=(resultSet.getFloat(4)*Integer.parseInt(hashMap.get(resultSet.getLong(1)+"")));
				arrayList.add(goodsBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return arrayList;
	}
	
	public void closeDB() {
		try {
			if (resultSet!=null) {
				resultSet.close();
				resultSet=null;
			}
			if (preparedStatement!=null) {
				preparedStatement.close();
				preparedStatement=null;
			}
			if (!connection.isClosed()) {
				connection.close();
				connection=null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
