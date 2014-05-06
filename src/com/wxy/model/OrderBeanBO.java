package com.wxy.model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderBeanBO {
	
	private ResultSet resultSet=null;
	private Connection connection=null;
	private PreparedStatement preparedStatement=null;
	
	public OrderInfoBean addOrder(MyCartBO myCartBO,String userId){
		OrderInfoBean orderInfoBean=new OrderInfoBean();
		try {
			connection=new ConnDB().getConnection();
			String sql="insert into orders(userid,orderdate,ispayed,totalprice) values(?,now(),?,?);";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, userId);
			preparedStatement.setByte(2, (byte)0);
			preparedStatement.setFloat(3, myCartBO.getAllPrice());
			int a=preparedStatement.executeUpdate();
			if (a>=1) {
				sql="select max(ordersid) from orders;";
				preparedStatement=connection.prepareStatement(sql);
				resultSet=preparedStatement.executeQuery();
				int orderId=0;
				if (resultSet.next()) {
					orderId=resultSet.getInt(1);
				}
				Statement statement=connection.createStatement();
				ArrayList<GoodsBean> arrayList=myCartBO.showMyCart();
				for (int i = 0; i < arrayList.size(); i++) {
					GoodsBean goodsBean=arrayList.get(i);
					sql="insert into orderDetail values('"+orderId+"','"+goodsBean.getGoodsId()+"','"+myCartBO.getGoodsNumById(goodsBean.getGoodsId()+"")+"');";
					statement.addBatch(sql);
				}
				statement.executeBatch();
				sql="select u.userid, u.username , u.realname , u.password , u.email , u.phone , u.address , u.zipcode, u.grade , "
						+ "o.ordersid , o.orderdate , o.maymode , o.ispayed , o.totalprice  from users as u, orders as o "
						+ "where o.ordersid = '"+orderId+"' and u.userid in (select userid from orders where ordersid = '"+orderId+"');";
				preparedStatement=connection.prepareStatement(sql);
				resultSet=preparedStatement.executeQuery();
				if (resultSet.next()) {
					orderInfoBean.setUserId(resultSet.getInt(1));
					orderInfoBean.setUserName(resultSet.getString(2));
					orderInfoBean.setRealName(resultSet.getString(3));
					orderInfoBean.setPassword(resultSet.getString(4));
					orderInfoBean.setEmail(resultSet.getString(5));
					orderInfoBean.setPhone(resultSet.getString(6));
					orderInfoBean.setAddress(resultSet.getString(7));
					orderInfoBean.setZipcode(resultSet.getString(8));
					orderInfoBean.setGrade(resultSet.getInt(9));
					orderInfoBean.setOrdersid(resultSet.getLong(10));
					orderInfoBean.setOrderdate(resultSet.getDate(11));
					orderInfoBean.setPaymode(resultSet.getString(12));
					orderInfoBean.setIspayed(resultSet.getByte(13));
					orderInfoBean.setTotalprice(resultSet.getFloat(14));
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally{
			this.closeDB();
		}
		return orderInfoBean;
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
