package com.wxy.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wxy.model.MyCartBO;
import com.wxy.model.OrderBeanBO;
import com.wxy.model.OrderInfoBean;
import com.wxy.model.UserBean;

/**
 * Servlet implementation class OrderClServlet
 */
@WebServlet("/OrderClServlet")
public class OrderClServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderClServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		OrderBeanBO orderBeanBO=new OrderBeanBO();
		MyCartBO myCartBO=(MyCartBO) request.getSession().getAttribute("myCartBO");
		long userId=((UserBean)request.getSession().getAttribute("userBean")).getUserId();
		OrderInfoBean orderInfoBean=orderBeanBO.addOrder(myCartBO, userId+"");
		if (orderInfoBean!=null) {
			request.setAttribute("orderInfoBean", orderInfoBean);
			request.getRequestDispatcher("/shopping4.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/shopping3.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
