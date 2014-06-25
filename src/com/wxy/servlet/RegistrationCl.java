package com.wxy.servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wxy.model.UserBeanBO;

/**
 * Servlet implementation class RegistrationCl
 */
@WebServlet("/RegistrationCl")
public class RegistrationCl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationCl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("userName");
		String realname = request.getParameter("realName");
		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String zipcode = request.getParameter("zipcode");
		String email = request.getParameter("email");
		if(username==null || realname==null || password==null || passwordConfirm==null || phone==null || address==null || zipcode==null || email==null){
			response.sendRedirect("registration.jsp");
			return;
		}
		int flag=0;
		UserBeanBO userBeanBO =new UserBeanBO();
		if(userBeanBO.hasUser(username)){
			request.setAttribute("info", "该用户名已经被使用");
			flag=1;
		} else if (userBeanBO.hasPhone(phone)) {
			request.setAttribute("info", "该电话号码已经被使用");
			flag=1;
		} else if (userBeanBO.hasEmail(email)) {
			request.setAttribute("info", "该电子邮件已经被使用");
			flag=1;
		}
		if(flag==1){
			Enumeration<String> enumeration=request.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String parameter=enumeration.nextElement();
				request.setAttribute(parameter, request.getParameter(parameter));	
			}
			request.getRequestDispatcher("registration.jsp").forward(request, response);
			return;
		}
		if(userBeanBO.registerUser(username, realname, password, phone, address, zipcode, email)){
			response.sendRedirect("registrationSuccess.jsp");
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
