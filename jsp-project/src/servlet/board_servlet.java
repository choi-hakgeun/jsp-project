package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Formatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.Location;

import bean.BD_ReplyDao;
import bean.BD_ReplyVo;
import bean.BoardDao;
import bean.BoardVo;
import bean.Board_Paging;
@WebServlet("*.sb")

public class board_servlet extends HttpServlet{

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
		case "/Board_selectE.sb":
			Board_selectE(req, resp);
			break;
		case "/Board_selectQ.sb":
			Board_selectQ(req, resp);
			break;
		case "/Board_selectG.sb":
			Board_selectG(req, resp);
			break;
		case "/Board_selectN.sb":
			Board_selectN(req, resp);
			break;
		case "/Board_insert.sb":
			Board_insert(req, resp);
			break;
		case "/Board_view.sb":
			Board_view(req, resp);
			break;
		case "/Board_modify.sb":
			Board_modify(req,resp);
			break;
		case "/Board_modifyR.sb":
			Board_modifyR(req,resp);
			break;
		case "/Board_delete.sb":
			Board_delete(req,resp);
			break;
		case "/Reply_insert.sb":
			Reply_insert(req,resp);
			break;
		case "/Reply_select.sb":
			Reply_select(req,resp);
			break;
		case "/Reply_modify.sb":
			Reply_modify(req,resp);
			break;
		case "/Reply_delete.sb":
			Reply_delete(req,resp);
			break;
		}
	}
	public void Reply_modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BD_ReplyVo vo = new BD_ReplyVo();
		BD_ReplyDao dao = new BD_ReplyDao();
		
		String serial = req.getParameter("serial");
		String reply = req.getParameter("txt");
		
		vo.setR_serial(serial);
		vo.setR_reply(reply);
		
		
		dao.modify(vo); // 댓글 시리얼
		
		String path = url + "/link-page/boards/board_result2.jsp"; // 고쳐
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void Reply_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BD_ReplyDao dao = new BD_ReplyDao();
		
		
		String serial = req.getParameter("serial");
		dao.delete(serial);
		
		
		
		String path = url + "/link-page/boards/board_result2.jsp"; // 고쳐
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void Reply_insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BD_ReplyDao dao = new BD_ReplyDao();
		BD_ReplyVo vo = new BD_ReplyVo();
		
		String id = req.getParameter("mid");
		String reply = req.getParameter("rpltxt");
		String board = req.getParameter("serial");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = sdf.format(cal.getTime());
		Timestamp t = Timestamp.valueOf(today);
		
		
		
		
		vo.setR_id(id); // m_name이나 m_id
		vo.setR_reply(reply); // 댓글 내용
		vo.setR_time(t);	// 시간
		vo.setR_board(board);	// 게시글 번호
		// 사진두 해야대
		dao.insert(vo);
		
		String path = url + "/link-page/boards/board_result2.jsp"; // 고쳐
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void Reply_select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BD_ReplyDao dao = new BD_ReplyDao();
		
		String serial = req.getParameter("serial"); // 시리얼값 보내야댐
		System.out.println("시리얼넘버:" + serial);
		List<BD_ReplyVo> list =  dao.select(serial);
		req.setAttribute("rplList", list);
	}
	
	public void Board_insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		
		
		int cg = Integer.parseInt(req.getParameter("category"));
		String title = req.getParameter("brd_title");
		String con = req.getParameter("brd_content");
		String mid = req.getParameter("brd_mid");
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = sdf.format(cal.getTime());
		Timestamp t = Timestamp.valueOf(today);
		
		System.out.println("mid 값: "+mid);
		
		BoardVo vo = new BoardVo();
		vo.setN_mid(mid);
		vo.setN_category(cg);
		vo.setN_content(con);
		vo.setN_title(title);
		vo.setN_date(t);

		dao.insert(vo);
		
		String path = url + "/link-page/boards/board_result.jsp"; // 고쳐
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	

	
	public void Board_selectE(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		int nowPage = 1;
		
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		Board_Paging p = new Board_Paging();
		p.setNowPage(nowPage);
		p.PageCompute();
		
		List<BoardVo> list = dao.selectE(p);
		
		
		
		req.setAttribute("BDlist", list);
		req.setAttribute("p", p);
		
		String path = url + "/link-page/boards/board_event.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void Board_selectQ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		int nowPage = 1;
		
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		Board_Paging p = new Board_Paging();
		p.setNowPage(nowPage);
		p.PageCompute();
		
		List<BoardVo> list = dao.selectQ(p);
		
		req.setAttribute("BDlist", list);
		req.setAttribute("p", p);
		
		String path = url + "/link-page/boards/board_QA.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void Board_selectG(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		int nowPage = 1;
		
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		Board_Paging p = new Board_Paging();
		p.setNowPage(nowPage);
		p.PageCompute();
		
		List<BoardVo> list = dao.selectG(p);
		
		req.setAttribute("BDlistG", list);
		req.setAttribute("p", p);
		
		String path = url + "/link-page/boards/board_general.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void Board_selectN(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		
		int nowPage = 1;
		
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		Board_Paging p = new Board_Paging();
		p.setNowPage(nowPage);
		p.PageCompute();
		
		List<BoardVo> list = dao.selectN(p);
		
		req.setAttribute("BDlist", list);
		req.setAttribute("p", p);
		
		String path = url + "/link-page/boards/board_notice.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void Board_view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		String serial = req.getParameter("serial");
		
		BoardVo vo = dao.view(serial);
		System.out.println("보드뷰 시리얼값>>" + serial);
		if(serial.indexOf("g")==0) {
			Reply_select(req, resp);
			System.out.println("리플 셀렉트");
		}
		
		req.setAttribute("vo", vo);
		
		String path = url + "/link-page/boards/board_view.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void Board_modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		String serial = req.getParameter("brd_serial");
		
		BoardVo vo = dao.view(serial);
		System.out.println("값나오는거:" + vo.getN_title() + " - " + vo.getN_content());
		req.setAttribute("vo", vo);
		
		String path = url + "/link-page/boards/board_modify.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void Board_modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String serial = req.getParameter("brd_serial");
		BoardVo vo = new BoardVo();
		
		vo.setN_title(title);
		vo.setN_content(content);
		vo.setN_serial(serial);
		System.out.println(1);
		dao.modify(vo);
		System.out.println(2);

		String path = url + "/link-page/boards/board_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void Board_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/link-page/main_board.jsp?board=";
		BoardDao dao = new BoardDao();
		
		String serial = req.getParameter("brd_serial");
		dao.delete(serial);
		
		String path = url + "/link-page/boards/board_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
}
