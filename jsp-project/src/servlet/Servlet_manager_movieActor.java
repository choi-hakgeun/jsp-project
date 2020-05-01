package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FileUpload;
import bean.ManagerContentVo;
import bean.ManagerMovieActorDao;
import bean.ManagerMovieActorVo;

@WebServlet("*.hkMmov")
public class Servlet_manager_movieActor extends HttpServlet{

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
		case "/insert.hkMmov":
			insert(req, resp);
		break;
		
		case "/insertR.hkMmov":
			insertR(req, resp);
		break;
		
		case "/select.hkMmov":
			select(req, resp);
		break;
		
		case "/view.hkMmov":
			view(req, resp);
		break;
		
		case "/modify.hkMmov":
			modify(req, resp);
		break;
		
		case "/modifyR.hkMmov":
			modifyR(req, resp);
		break;
		
		case "/deleteR.hkMmov":
			deleteR(req, resp);
		}
	}
	
	public void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String findStr = req.getParameter("findStr");
		
		System.out.println(findStr);
		
		String path = "manager_main.jsp?inc=manager_movieActor_insert.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String msg = "인물 정보가 정상적으로 저장되었습니다.";
		ManagerMovieActorVo vo = new ManagerMovieActorVo();
		ManagerMovieActorDao dao = new ManagerMovieActorDao();
		
		FileUpload fu = new FileUpload(req, resp);
		vo = fu.movieActorUploading();
			
		msg = dao.insert(vo);
		req.setAttribute("msg", msg);
		
		String path = "manager_main.jsp?inc=manager_movieActor_insert_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerMovieActorDao dao = new ManagerMovieActorDao();
		String findStr = "";
		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		
		List<ManagerMovieActorVo> list = dao.select(findStr);
		req.setAttribute("list", list);
		
		String path = "manager_main.jsp?inc=manager_movieActor_select.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerMovieActorDao dao = new ManagerMovieActorDao();
		String a_id = req.getParameter("a_id");
		ManagerMovieActorVo vo = dao.view(a_id);
		
		req.setAttribute("vo", vo);
		
		String path = "manager_main.jsp?inc=manager_movieActor_view.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = "manager_main.jsp?inc=manager_movieActor_modify.jsp";
		
		ManagerMovieActorDao dao = new ManagerMovieActorDao();
		String a_id = req.getParameter("a_id");
		ManagerMovieActorVo vo = dao.view(a_id);
		
		req.setAttribute("vo", vo);
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String msg = "인물 정보가 정상적으로 수정되었습니다.";
		ManagerMovieActorDao dao = new ManagerMovieActorDao();
		ManagerMovieActorVo vo = new ManagerMovieActorVo();
		
		FileUpload fu = new FileUpload(req, resp);
		vo = fu.movieActorUploading();
		
		msg = dao.update(vo);
		
		req.setAttribute("msg", msg);
		
		String path = "manager_main.jsp?inc=manager_movieActor_modify_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String msg = "삭제";
		System.out.println("1");
		ManagerMovieActorDao dao = new ManagerMovieActorDao();
		ManagerMovieActorVo vo = new ManagerMovieActorVo();
		
		FileUpload fu = new FileUpload(req, resp);
		vo = fu.movieActorUploading();
		
		 String a_id = vo.getA_id();
		
		System.out.println("2");
		
		msg = dao.delete(a_id);
		
		req.setAttribute("msg", msg);
		System.out.println("3");
		String path = "manager_main.jsp?inc=manager_movieActor_delete_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
