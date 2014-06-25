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
 * Servlet implementation class ManagerCl
 */
@WebServlet("/ManagerCl")
public class ManagerCl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerCl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cmd=request.getParameter("cmd");
		String goodsId=request.getParameter("id");
		GoodsBeanBO goodsBeanBO=new GoodsBeanBO();
		GoodsBean goodsBean=goodsBeanBO.getGoodsBean(goodsId);
		if (cmd.equals("managerDetail")) {
			request.setAttribute("goodsInfo", goodsBean);
			request.getRequestDispatcher("/detailManager.jsp").forward(request, response);
		} else if(cmd.equals("updateGoods")){
			goodsBean.setGoodsName(request.getParameter("goodsName"));
			goodsBean.setGoodsPrice(Float.parseFloat(request.getParameter("goodsPrice")));
			goodsBean.setType(request.getParameter("type"));
			goodsBean.setPublisher(request.getParameter("publisher"));
			goodsBean.setGoodsIntro(request.getParameter("goodsIntro"));
			if(goodsBeanBO.updateGoods(goodsBean)){
				request.setAttribute("message", "保存商品信息成功");
				goodsBean=goodsBeanBO.getGoodsBean(goodsId);
			}
			else{
				request.setAttribute("message", "保存商品信息失败");
			}
			request.setAttribute("goodsInfo", goodsBean);
			request.getRequestDispatcher("/detailManager.jsp").forward(request, response);
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
