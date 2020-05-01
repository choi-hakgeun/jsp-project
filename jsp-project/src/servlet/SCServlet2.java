package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ContentInsertPhoto;
import bean.SCActorVo;
import bean.SCCommentVo;
import bean.SCContentVo;
import bean.SCDao;
import bean.he_dao;

@WebServlet("/contentPage")

public class SCServlet2 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cId = req.getParameter("cId");
		String path = "/link-page/contentPage.jsp";
		SCDao dao = new SCDao();
		SCContentVo cVo = dao.contentSelect(cId);
		ContentInsertPhoto pVo = dao.jsonParsing(cId);
		List<SCActorVo> aList = dao.actorsSelect(cId);
		List<SCCommentVo> cList = dao.commentSelect(cId);
		SCCommentVo cntVo = dao.chart(cId);
		
		he_dao dao2 = new he_dao();
		dao2.searchUpdate(cId);

		RequestDispatcher rd = req.getRequestDispatcher(path);
		req.setAttribute("cVo", cVo);
		req.setAttribute("pVo", pVo);
		req.setAttribute("aList", aList);
		req.setAttribute("cList", cList);
		req.setAttribute("cntVo", cntVo);

		rd.forward(req, res);
	} // end of doget

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mId = req.getParameter("mId");
		String cId = req.getParameter("cId");
		String interest = req.getParameter("interest");
		String category = req.getParameter("category");
		
		SCDao dao = new SCDao();
		boolean intCheck = dao.interestCheck(mId, cId);
		
		if(intCheck) {
			dao.interestUpdate(mId, cId, interest); 
		} else {
			dao.interestInsert(mId, cId, interest, category); 
		}
		
	} // end of do post


	
	
} // end of class
