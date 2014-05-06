package com.wxy.servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wxy.model.GoodsBean;
import com.wxy.model.MyCartBO;
import com.wxy.model.UserBean;
import com.wxy.model.UserBeanBO;

/**
 * Servlet implementation class LoginCl
 */
@WebServlet("/LoginCl")
public class LoginCl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");		
		HttpSession httpSession=request.getSession();
		if (username==null || username.equals("")) {	//用户名为空，返回重新登录
			httpSession.setAttribute("info", "usernamenull");
			request.getRequestDispatcher("shopping2.jsp").forward(request, response);
		} else if (password==null || password.equals("")) {		//密码为空，返回重新登录
			httpSession.setAttribute("info", "passwordnull");
			request.getRequestDispatcher("shopping2.jsp").forward(request, response);
		} else {			//用户名和密码验证			
			UserBeanBO userBeanBO =new UserBeanBO();
			int check=userBeanBO.checkUser(username, password);
			switch (check) {
				case 0:			//用户名不存在
					System.out.println(username);
					System.out.println(password);
					httpSession.setAttribute("info", "usernameerror");
					request.getRequestDispatcher("shopping2.jsp").forward(request, response);
					break;
					
				case 1:			//密码错误
					httpSession.setAttribute("info", "passworderror");
					request.getRequestDispatcher("shopping2.jsp").forward(request, response);
					break;
					
				case 2:			//用户名和密码都正确
					String userkeep	=request.getParameter("userkeep");
					if (userkeep!=null) {
						Cookie cookie=new Cookie("username", username);
						cookie.setMaxAge(14*24*3600);
						response.addCookie(cookie);
					}
					UserBean userBean=userBeanBO.getUserBean(username);
					httpSession.setAttribute("userBean", userBean);
					MyCartBO myCartBO=(MyCartBO) request.getSession().getAttribute("myCartBO");
					ArrayList<GoodsBean> arrayList=myCartBO.showMyCart();
					request.setAttribute("myCartInfo", arrayList);
					request.getRequestDispatcher("shopping3.jsp").forward(request, response);
					break;

				default:
					break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
