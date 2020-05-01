package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.ContentVo;
import bean.SCCommentVo;
import bean.SCDao;

@WebServlet("*.sc")
public class CommentScoreServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String mId = req.getParameter("mId");
		String cId = req.getParameter("cId");
		String send = req.getParameter("sendMid");
		
		SCDao dao = new SCDao();
		String like = dao.commentLike(mId, cId, send);
		
		PrintWriter out = res.getWriter();
		out.print(like);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);

		switch (tempUrl) {
		case "/newInterest.sc":
			try {
				newInterest(req, res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "/newComment.sc":
			try {
				newComment(req, res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		} // end of switch

	} // end of dopost

	public void newInterest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
		String mId = req.getParameter("mId");
		String score = req.getParameter("score");
		String cId = req.getParameter("cId");
		String create = req.getParameter("create");
		String category = req.getParameter("category");
		JSONObject obj = new JSONObject();
		SCDao dao = new SCDao();
		boolean check = dao.commentCheck(cId, mId);
		
		if (create.equals("new") && check == false) {
			dao.commentInsert(mId, cId, score, category);
		} else {
			boolean flag = dao.commentUpdate(mId, cId, score, category);
			if (flag) {
				obj.put("result", "수정완료");
				PrintWriter pw = res.getWriter();
				pw.print(obj);
				pw.flush();
				pw.close();
				dao.conn.close();
			} else {
				obj.put("result", "수정실패");
				PrintWriter pw = res.getWriter();
				pw.print(obj);
				pw.flush();
				pw.close();
				dao.conn.close();
			}
		}
	}

	public void newComment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
		String mId = req.getParameter("mId");
		String cId = req.getParameter("cId");
		String content = req.getParameter("content");
		SCDao dao = new SCDao();
		JSONObject obj = new JSONObject();

		dao.comment_insert(mId, cId, content);

		PrintWriter pw = res.getWriter();
		pw.print(obj);
		pw.flush();
		pw.close();
		dao.conn.close();
	}
} // end of class
