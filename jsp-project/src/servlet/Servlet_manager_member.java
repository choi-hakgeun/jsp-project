package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ManagerMemberDao;
import bean.ManagerMemberVo;

@WebServlet("*.hkMm")
public class Servlet_manager_member extends HttpServlet{

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
		
		case "/select.hkMm":
			select(req, resp);
		break;
		
		case "/view.hkMm":
			view(req, resp);
		break;
		
		case "/modify.hkMm":
			modify(req, resp);
		break;
		
		case "/modifyR.hkMm":
			modifyR(req, resp);
		break;
		
		case "/deleteR.hkMm":
			deleteR(req, resp);
		}
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerMemberDao dao = new ManagerMemberDao();
		String findStr = "";

		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}

		List<ManagerMemberVo> list = dao.select(findStr);
		req.setAttribute("list", list);
		
		String path = "manager_main.jsp?inc=manager_member_select.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerMemberDao dao = new ManagerMemberDao();
		String m_mId = req.getParameter("m_mId");
		ManagerMemberVo vo = dao.view(m_mId);
		
		req.setAttribute("vo", vo);
		
		String path = "manager_main.jsp?inc=manager_member_view.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerMemberDao dao = new ManagerMemberDao();
		String m_mId = req.getParameter("m_mId");
		ManagerMemberVo vo = dao.view(m_mId);

		req.setAttribute("vo", vo);

		String path = "manager_main.jsp?inc=manager_member_modify.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		ManagerMemberVo vo = new ManagerMemberVo();
		ManagerMemberDao dao  = new ManagerMemberDao();
		
		String mId = req.getParameter("m_mId");
		String mName = req.getParameter("m_name");
		String mPhone = req.getParameter("m_phone");
		String mProfile = req.getParameter("m_profile");
		System.out.println(mId);
		System.out.println(mName);
		System.out.println(mPhone);
		System.out.println(mProfile);
		
		vo.setM_mId(mId);
		vo.setM_name(mName);
		vo.setM_phone(mPhone);
		vo.setM_profile(mProfile);
		
		String msg = dao.update(vo);
	
		req.setAttribute("msg", msg);
		req.setAttribute("vo", vo);

		String path = "manager_main.jsp?inc=manager_member_modify_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String msg = "삭제";
		ManagerMemberDao dao = new ManagerMemberDao();
		String mId = req.getParameter("m_mId");
		
		msg = dao.delete(mId);
		req.setAttribute("msg", msg);
		
		String path = "manager_main.jsp?inc=manager_member_delete_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
