package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FileUpload;
import bean.HGMemberDao;
import bean.HGMemberVo;

@WebServlet("*.hg")
public class HGMemberServlet extends HttpServlet{
	String url = "/link-page/";
	
			
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HGMemberDao dao = new HGMemberDao();
		HGMemberVo vo = dao.select(req.getParameter("mId"));
		
		req.setAttribute("vo", vo);
		String path = url+ "member_main.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String temp = url+ req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);
		switch(tempUrl) {
		case "/select.hg":
			select(req, resp);
			System.out.println("doPost 스위치캐이스문 select실행");
			break;
		case "/view.hg":
			view(req, resp);
			System.out.println("doPost 스위치캐이스문 view실행");
			break;			
		case "/modify.hg":
			modify(req, resp);
			System.out.println("doPost 스위치캐이스문 modify실행");
			break;
		case "/modifyR.hg":
			modifyR(req, resp);
			System.out.println("doPost 스위치캐이스문 modifyR 실행");
			break;
		case "/deleteR.hg":
			System.out.println("doPost 스위치캐이스문 deleteR 실행");
			deleteR(req, resp);
			break;
		}
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url + "/member_main.jsp";
		
		HGMemberDao dao = new HGMemberDao();
		String mId = req.getParameter("mId");
		
		HGMemberVo vo = dao.select(mId);
		
		req.setAttribute("vo", vo);		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url+ "/member_main.jsp";
		
		HGMemberDao dao = new HGMemberDao();
		String mId = req.getParameter("mId");
		HGMemberVo vo = dao.view(mId);
		
		req.setAttribute("vo", vo);		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url+ "/member_main.jsp";
		
		HGMemberDao dao = new HGMemberDao();
		String mId = req.getParameter("mId");
		HGMemberVo vo = dao.view(mId);
		
		req.setAttribute("vo", vo);		
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url+ "/select.hg";
		String msg = "데이터가 정상적으로 수정되었습니다.";
		
		FileUpload fu = new FileUpload(req, resp);
		HGMemberVo vo = fu.memberUploading();
		
		HGMemberDao dao = new HGMemberDao();
		msg = dao.modify(vo);
		
		req.setAttribute("msg", msg);		
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HGMemberDao dao = new HGMemberDao();
		String mId = req.getParameter("inputEmail3");
		String pwd = req.getParameter("inputPassword3");
		boolean r = dao.deleteR(mId, pwd);
		
		String path = "/index.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
		
	}

}
