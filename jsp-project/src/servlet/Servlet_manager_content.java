package servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import bean.ContentVo;
import bean.FileUpload;
import bean.ManagerContentDao;
import bean.ManagerContentVo;
import bean.SCContentVo;
import bean.SCDao;

@WebServlet("*.hkMcon")
public class Servlet_manager_content extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);
		
		switch(tempUrl) {
		case "/insert.hkMcon":
			insert(req, resp);
		break;
		
		case "/insertR.hkMcon":
			insertR(req, resp);
		break;
		
		case "/select.hkMcon":
			select(req, resp);
		break;
		
		case "/view.hkMcon":
			view(req,  resp);
		break;
		
		case "/modify.hkMcon":
			modify(req, resp);
		break;
		
		case "/modifyR.hkMcon":
			modifyR(req, resp);
		break;
		
		case "/deleteR.hkMcon":
			deleteR(req, resp);
		}
	}
	
	public void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String findStr = req.getParameter("findStr");
		
		String path ="manager_main.jsp?inc=manager_content_insert.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerContentDao dao = new ManagerContentDao();
		SCContentVo vo = new SCContentVo();
		
		
		FileUpload fu = new FileUpload(req, resp);
		vo = fu.uploading();
		String other = 
				"{\"long\":\""+ vo.getPvo().getLongPhoto()+"\",\"gallery1\":\""+vo.getPvo().getGallery1()+"\","
				+"\"gallery2\":\""+vo.getPvo().getGallery2()+"\",\"gallery3\":\""+vo.getPvo().getGallery3()+"\","
				+"\"gallery4\":\""+vo.getPvo().getGallery4()+"\",\"date\":\""+vo.getDate()+"\"}";
		
		JSONParser parser = new JSONParser();
		try {
			Map json = (Map)parser.parse(other);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		FileWriter file = new FileWriter("C:/Users/82103/eclipse-workspace/Servers/WebContent/lib"+vo.getcId()+".txt");
		file.write(other);
		file.close();
		
		vo.setOther("/lib/"+vo.getcId()+".txt");
		
		String msg = dao.insert(vo);
		req.setAttribute("msg", msg);
		
		String path = "manager_main.jsp?inc=manager_content_insert_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerContentDao dao = new ManagerContentDao();
		String findStr = "";
		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		
		List<ManagerContentVo> list = dao.select(findStr);
		req.setAttribute("list", list);
		
		String path =  "manager_main.jsp?inc=manager_content_select.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerContentDao dao = new ManagerContentDao();
		String c_id = req.getParameter("c_id");
		ManagerContentVo vo = dao.view(c_id);
		
		req.setAttribute("vo", vo);
		
		String path = "manager_main.jsp?inc=manager_content_view.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ManagerContentDao dao = new ManagerContentDao();
		String c_id = req.getParameter("c_id");
		ManagerContentVo vo = dao.view(c_id);
		
		req.setAttribute("vo", vo);
		
		String path =  "manager_main.jsp?inc=manager_content_modify.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String msg = "컨텐츠 정보가 정상적으로 수정되었습니다.";
		ManagerContentDao dao = new ManagerContentDao();
		ManagerContentVo vo = new ManagerContentVo();

		String cId = req.getParameter("c_id");
		String cName = req.getParameter("c_name");
		String cCategory = req.getParameter("c_category");
		String cGenre = req.getParameter("c_genre");
		String cStory = req.getParameter("c_story");
		String cPreview = req.getParameter("c_preview");
		String cOther = req.getParameter("c_other");
		
		vo.setC_id(cId);
		vo.setC_name(cName);
		vo.setC_category(Integer.parseInt(cCategory));
		vo.setC_genre(cGenre);
		vo.setC_story(cStory);
		vo.setC_preview(cPreview);
		vo.setC_other(cOther);
		
		msg = dao.modify(vo);
		
		req.setAttribute("msg", msg);
		req.setAttribute("vo", vo);
		
		String path = "manager_main.jsp?inc=manager_content_modify_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String msg = "삭제";
		ManagerContentDao dao = new ManagerContentDao();
		String c_id = req.getParameter("c_id");
		
		msg = dao.delete(c_id);
		req.setAttribute("msg", msg);
		
		String path ="manager_main.jsp?inc=manager_content_delete_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

public void moreContent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{	
		String cId = req.getParameter("cId");	
		System.out.println(cId);	
		SCDao dao = new SCDao();	
		ContentVo vo = dao.view(cId);	
		System.out.println("dao후");	
		req.setAttribute("vo", vo);	
		System.out.println("req 후");	
		String path = "/link-page/content_view_page.jsp";	
		RequestDispatcher rd = req.getRequestDispatcher(path);	
		rd.forward(req, resp);	
			
	}
}
