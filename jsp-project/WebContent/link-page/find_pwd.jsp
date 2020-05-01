<%@page import="bean.he_dao"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String mId = request.getParameter("find_pwd_email");

	// 먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
	
	he_dao dao = new he_dao();
	
	if(!dao.mail_check(mId)) {
		out.print("존재하지 않는 이메일입니다");
	}else{
	
		// mail server 설정
		final String host = "smtp.naver.com";
		final String user = "llomoll3991@naver.com"; // 자신의 네이버 계정
		final String password = "bean667485??";// 자신의 네이버 패스워드
		
		// 메일 받을 주소
		/* String to_email = m.getEmail(); */
		String to_email = mId;
		String pwd = dao.find_pwd(mId);
		
		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true"); 
		props.put("mail.debug", "true");
		
		
		Session session2 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session2);
			msg.setFrom(new InternetAddress(user, "seecha"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
		
			// 메일 제목
			msg.setSubject("안녕하세요  seecha 비밀번호 찾기 메일입니다.");
			// 메일 내용
			msg.setText("비밀번호 :" + pwd);
		
			Transport.send(msg);
			out.print("이메일로 비밀번호를 전송하였습니다");
			System.out.println("이메일 전송");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	
	}
			

%>