package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ContentDao;
import bean.ContentVo;

@WebServlet("*.mm")

public class Servlet extends HttpServlet{
 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);
	
		switch(tempUrl) {
		case "/Content_select.mm":
			Content_select(req, resp);
			break;
		} //end of switch 
	}
	
	
	public void Content_select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ContentDao dao = new ContentDao();
		String findStr = req.getParameter("findStr");
		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		System.out.println("findstr : " + findStr);
		List<ContentVo> list = dao.select(findStr);
		
		req.setAttribute("list", list);
		req.setAttribute("findStr", findStr);
		
		String path = "/link-page/findPage.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

}
