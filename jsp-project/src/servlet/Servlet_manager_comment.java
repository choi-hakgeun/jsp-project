package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ManagerCommentDao;
import bean.ManagerCommentVo;

@WebServlet("*.hkMcom")
public class Servlet_manager_comment extends HttpServlet{

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
		case "/select.hkMcom":
			select(req, resp);
		break;
		
		case "/view.hkMcom":
			view(req, resp);
		break;
		
		case "/modify.hkMcom":
			modify(req, resp);
		break;
		
		case "/modifyR.hkMcom":
			modifyR(req, resp);
		break;
		
		case "/deleteR.hkMcom":
			deleteR(req, resp);

		}
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerCommentDao dao = new ManagerCommentDao();
		String findStr = "";
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		List<ManagerCommentVo> list = dao.select(findStr);
		req.setAttribute("list", list);
		
		String path = "manager_main.jsp?inc=manager_comment_select.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerCommentDao dao = new ManagerCommentDao();
		String com_mId = req.getParameter("com_mId");
		ManagerCommentVo vo = dao.view(com_mId);
		
		req.setAttribute("vo", vo);
		
		String path = "manager_main.jsp?inc=manager_comment_view.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerCommentDao dao = new ManagerCommentDao();
		String com_mId = req.getParameter("com_mId");
		ManagerCommentVo vo = dao.view(com_mId);
		
		req.setAttribute("vo", vo);
		
		String path = "manager_main.jsp?inc=manager_comment_modify.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String msg = "코멘트 정보가 정상적으로 수정되었습니다.";
		ManagerCommentDao dao = new ManagerCommentDao();
		ManagerCommentVo vo = new ManagerCommentVo();
		
		String mId = req.getParameter("com_mId");
		String cId = req.getParameter("com_cId");
		String like = req.getParameter("com_like");
		String content = req.getParameter("con_content");
		
		vo.setCom_mId(mId);
		vo.setCom_cId(cId);
		vo.setCom_like(Integer.parseInt(like));
		vo.setCon_content(content);
		
		msg = dao.update(vo);
		
		req.setAttribute("msg", msg);
		req.setAttribute("vo", vo);
		
		String path = "manager_main.jsp?inc=manager_comment_modify_result.jsp";
		RequestDispatcher rd  = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String msg = "삭제";
		ManagerCommentDao dao = new ManagerCommentDao();
		String com_mId = req.getParameter("com_mId");
		
		msg = dao.delete(com_mId);
		req.setAttribute("msg", msg);
		
		String path = "manager_main.jsp?inc=manager_comment_delete_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

}