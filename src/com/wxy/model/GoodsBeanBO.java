package com.wxy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GoodsBeanBO {
	
	private ResultSet resultSet=null;
	private Connection connection=null;
	private PreparedStatement preparedStatement=null;
	
	
	public int getPageCount(int pageSize) {
		int pageCount=0;
		int rowCount=0;
		try {
			connection=new ConnDB().getConnection();
			String sql="select count(*) from goods";
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			if(resultSet.next()){
				rowCount=resultSet.getInt(1);
			}
			pageCount=(rowCount%pageSize==0)?(rowCount/pageSize):(rowCount/pageSize+1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return pageCount;
	}
	
	
	public ArrayList<GoodsBean> getGoodsByPage(int pageSize,int pageNow) {
		ArrayList<GoodsBean> arrayList=new ArrayList<GoodsBean>();
		try {
			connection=new ConnDB().getConnection();
			String sql="select * from goods limit "+(pageNow-1)*pageSize+","+pageSize+";";
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			GoodsBean goodsBean;
			while (resultSet.next()) {
				goodsBean=new GoodsBean();
				goodsBean.setGoodsId(resultSet.getLong(1));
				goodsBean.setGoodsName(resultSet.getString(2));
				goodsBean.setGoodsIntro(resultSet.getString(3));
				goodsBean.setGoodsPrice(resultSet.getFloat(4));
				goodsBean.setGoodsNum(resultSet.getInt(5));
				goodsBean.setPublisher(resultSet.getString(6));
				goodsBean.setPhoto(resultSet.getString(7));
				goodsBean.setType(resultSet.getString(8));
				arrayList.add(goodsBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return arrayList;
	}
	
	public GoodsBean getGoodsBean(String id) {
		GoodsBean goodsBean=new GoodsBean();
		try {
			connection=new ConnDB().getConnection();
			String sql="select * from goods where goodsId = ?";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			resultSet=preparedStatement.executeQuery();
			if(resultSet.next()){
				goodsBean.setGoodsId(resultSet.getLong(1));
				goodsBean.setGoodsName(resultSet.getString(2));
				goodsBean.setGoodsIntro(resultSet.getString(3));
				goodsBean.setGoodsPrice(resultSet.getFloat(4));
				goodsBean.setGoodsNum(resultSet.getInt(5));
				goodsBean.setPublisher(resultSet.getString(6));
				goodsBean.setPhoto(resultSet.getString(7));
				goodsBean.setType(resultSet.getString(8));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return goodsBean;
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
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
