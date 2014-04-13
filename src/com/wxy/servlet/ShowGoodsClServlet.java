package com.wxy.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wxy.model.GoodsBean;
import com.wxy.model.GoodsBeanBO;

/**
 * Servlet implementation class ShowGoodsClServlet
 */
@WebServlet("/ShowGoodsClServlet")
public class ShowGoodsClServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowGoodsClServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cmd=request.getParameter("cmd");
		if (cmd.equals("showDetail")) {
			String goodsId=request.getParameter("id");
			GoodsBeanBO goodsBeanBO=new GoodsBeanBO();
			GoodsBean goodsBean=goodsBeanBO.getGoodsBean(goodsId);
			request.setAttribute("goodsInfo", goodsBean);
			request.getRequestDispatcher("/showDetail.jsp").forward(request, response);
		} else if (cmd.equals("fenye")) {
			String pageNow=request.getParameter("pageNow");
			request.getRequestDispatcher("/index.jsp?pageNow="+pageNow).forward(request, response);
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
