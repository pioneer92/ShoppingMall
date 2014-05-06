package com.wxy.model;

import java.sql.*;

public class UserBeanBO {
	private Connection connection=null;
	private Statement statement=null;
	private ResultSet resultSet=null;
	
	public int checkUser(String username,String password){
		int b=0;
		try {
			ConnDB connDB=new ConnDB();
			connection=connDB.getConnection();
			statement=connection.createStatement();
			resultSet=statement.executeQuery("select password from users where username = '"+username+"' limit 1;");
			if (resultSet.next()) {
				b++;
				String dbPassword=resultSet.getString(1);
				if (dbPassword.equals(password)) {
					b++;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			this.closeDB();
		}
		return b;
	}
	
	public UserBean getUserBean(String username) {
		UserBean userBean=new UserBean();
		try {
			ConnDB connDB=new ConnDB();
			connection=connDB.getConnection();
			statement=connection.createStatement();
			resultSet=statement.executeQuery("select * from users where username = '"+username+"' limit 1;");
			if (resultSet.next()) {
				userBean.setUserId(resultSet.getInt(1));
				userBean.setUserName(resultSet.getString(2));
				userBean.setRealName(resultSet.getString(3));
				userBean.setPassword(resultSet.getString(4));
				userBean.setPhone(resultSet.getString(5));
				userBean.setAddress(resultSet.getString(6));
				userBean.setZipcode(resultSet.getString(7));
				userBean.setEmail(resultSet.getString(8));
				userBean.setGrade(resultSet.getInt(9));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return userBean;
	}
	
	public void closeDB(){
		try {
			if (resultSet!=null) {
				resultSet.close();
				resultSet=null;
			}
			if (statement!=null) {
				statement.close();
				statement=null;
			}
			if (connection!=null) {
				connection.close();
				connection=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
