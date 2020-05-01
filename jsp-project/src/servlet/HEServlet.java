package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ContentDao;
import bean.ContentVo;
import bean.he_dao;
import bean.he_vo;

@WebServlet("*.he")
public class HEServlet extends HttpServlet{ 
	
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
		case "/my_movies.he":
			myMovies(req,resp);
			break;
		case "/my_movies_plus.he":
			myMoviesPlus(req,resp);
			break;
		case "/my_movies_more.he":
			rank_more(req,resp);
			break;
		case "/wish.he":
			wish(req,resp);
			break;
		case "/watching.he":
			watching(req,resp);
			break;
		case "/my_taste.he":
			taste(req,resp);
			break;

				
	
		} //end of switch 
	}
	
	public void myMovies(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String mid =req.getParameter("member_hidden_id");
		String cmd = req.getParameter("member_hidden_category");
		he_dao dao = new he_dao();
		List<he_vo> list = new ArrayList<he_vo>();
		String cnt = dao.cnt_myMovies(mid, cmd); 
		String cnt2 = dao.cnt_wantMovies(mid, cmd); 
		String cnt3 =dao.cnt_watchingMovies(mid, cmd);
		list = dao.my_movies(mid, cmd);
		
		for(int i=0; i<list.size();i++) {
			String contId = list.get(i).getCont_id();	
			he_vo vo = dao.my_movies_cont(contId);
			list.get(i).setCont_name(vo.getCont_name());
			list.get(i).setCont_img(vo.getCont_img());
		}
		
		req.setAttribute("list", list);
		req.setAttribute("cnt", cnt);
		req.setAttribute("cnt2", cnt2);
		req.setAttribute("cnt3", cnt3);
		req.setAttribute("mId", mid);
		String path = "";
		if(cmd.equals("0")) {
			path="/link-page/my-movies.jsp";	
		} else {
			path="/link-page/my-dramas.jsp";
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void myMoviesPlus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String mid =req.getParameter("movies_hidden_id");
		String cmd =req.getParameter("cmd");
		he_dao dao = new he_dao();
		List<he_vo> list = new ArrayList<he_vo>();
		list = dao.my_movies(mid,cmd);
		
		for(int i=0; i<list.size();i++) {
			String contId = list.get(i).getCont_id();	
			he_vo vo = dao.my_movies_cont(contId);
			list.get(i).setCont_name(vo.getCont_name());
			list.get(i).setCont_img(vo.getCont_img());
		}
		req.setAttribute("list", list);
		req.setAttribute("mId", mid);
		
		
		for(int j=1; j<6; j++) {
			list = dao.my_movies_rank(mid, cmd, j);
			
			for(int i=0; i<list.size();i++) {
				String contId = list.get(i).getCont_id();	
				he_vo vo = dao.my_movies_cont(contId);
				list.get(i).setCont_name(vo.getCont_name());
				list.get(i).setCont_img(vo.getCont_img());
			}
			String k =dao.cnt_rank(mid, cmd, j);
			req.setAttribute("cnt"+j, k);
			
			req.setAttribute("rank"+j, list);
			
		}
		
		String path = "";
		if(cmd.equals("0")) {
			path="/link-page/myMoviesPlus.jsp";	
		} else {
			path="/link-page/myDramasPlus.jsp";
		}
		

		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void rank_more(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String mid =req.getParameter("movies_hidden_id");
		String cmd = req.getParameter("cmd");
		int score = Integer.parseInt(req.getParameter("score"));

		he_dao dao = new he_dao();
		List<he_vo> list = new ArrayList<he_vo>();
		
		list = dao.my_movies_rank(mid, cmd, score);
		
		for(int i=0; i<list.size();i++) {
			String contId = list.get(i).getCont_id();	
			he_vo vo = dao.my_movies_cont(contId);
			list.get(i).setCont_name(vo.getCont_name());
			list.get(i).setCont_img(vo.getCont_img());
		}
		req.setAttribute("score",score);
		req.setAttribute("list",list);
		req.setAttribute("mId", mid);

		String path = "";
		if(cmd.equals("0")) {
			path="/link-page/my-movies-rank1.jsp";	
		} else {
			path="/link-page/my-dramas-rank1.jsp";
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void wish(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String mid =req.getParameter("movies_hidden_id");
		String cmd = req.getParameter("cmd");
		he_dao dao = new he_dao();
		List<he_vo> list = new ArrayList<he_vo>();
		
		list = dao.my_wish(mid, cmd);
		
		for(int i=0; i<list.size();i++) {
			String contId = list.get(i).getCont_id();	
			he_vo vo = dao.my_movies_cont(contId);
			list.get(i).setCont_name(vo.getCont_name());
			list.get(i).setCont_img(vo.getCont_img());
		}
		req.setAttribute("list", list);
		req.setAttribute("mId", mid);
	
		String path="/link-page/my-movies-wish.jsp";	
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void watching(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String mid =req.getParameter("movies_hidden_id");
		String cmd = req.getParameter("cmd");

		he_dao dao = new he_dao();
		List<he_vo> list = new ArrayList<he_vo>();
		
		list = dao.my_watching(mid, cmd);
		
		for(int i=0; i<list.size();i++) {
			String contId = list.get(i).getCont_id();	
			he_vo vo = dao.my_movies_cont(contId);
			list.get(i).setCont_name(vo.getCont_name());
			list.get(i).setCont_img(vo.getCont_img());
		}
		
		req.setAttribute("list", list);
		req.setAttribute("mId", mid);
	
		
		String path="/link-page/my-movies-watching.jsp";	
	
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void taste(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String mid =req.getParameter("member_hidden_id");

		he_dao dao = new he_dao();
		he_vo vo = dao.findName(mid);//이름정보
		String mname = vo.getmName();
		String photo = vo.getCont_img();
		req.setAttribute("name", mname);
		req.setAttribute("photo", photo);
		
		String movie = dao.cnt_myMovies(mid, "0");//평가한 영화 갯수
		String drama = dao.cnt_myMovies(mid, "1");//평가한 드라마 갯수
		req.setAttribute("movie", movie);
		req.setAttribute("drama", drama);
		
		int max = 0;
		int rk =0;
		for(int i=1;i<6;i++) {
			int num =dao.my_rank(mid, i); 
			req.setAttribute("rank"+i, num);//점수 별 별점 준 수
			if(max<num) {
				max  = num;
				rk = i;
			}
		}	
		req.setAttribute("max", rk);//가장 별점 많이 준 점수 
	
		List<String> list = dao.my_avg(mid);	
		req.setAttribute("avg", list.get(0));//평균
		req.setAttribute("cnt", list.get(1));//별점 준 수 
		
		List<he_vo> list2 = dao.like_genre(mid);
		req.setAttribute("genre", list2);//좋아하는 장르 정보 
		
		String path="/link-page/my-taste.jsp";	
	
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);

		
	}
	

}
