package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InfoServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// form 형식 post방식 가능

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String name = request.getParameter("pname");
		String pwd = request.getParameter("pwd");
		String job = request.getParameter("job");

		String ggMail = request.getParameter("ggMail"); // 체크하지 않고 넘겨주면, null값임
		String adverMail = request.getParameter("adverMail");
		String chkMail = request.getParameter("chkMail");

		String[] gender = request.getParameterValues("chk_gender");

		if (gender[0].equals("M")) { // name이 가진 value값 비교

			gender[0] = "남자";
		} else {

			gender[0] = "여자";
		}

		if (ggMail == null) { //체크하지않으면 null값이 날라옴
			ggMail = "받지않음";
		}
		if (adverMail == null) {
			adverMail = "받지않음";
		}
		if (chkMail == null) {
			chkMail = "받지않음";
		}

//		response 객체로 화면에 출력
		
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<title>메소드 호출방식 - POST</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>개인 정보 출력</h2>");
		out.println("=============================================<br>");
		out.println("이름 : " + name + "<br>");
		out.println("아이디 : " + id + "<br>");
		out.println("암호 : " + pwd + "<br>");
		out.println("성별 : " + gender[0] + "<br>");
		out.println("공지메일 : " + ggMail + "<br>");
		out.println("광고메일 : " + adverMail + "<br>");
		out.println("배송 확인 메일 : " + chkMail + "<br>");

		out.println("직업 : " + job + "<br>");
		out.println("=============================================<br>");

		out.println("</body>");
		out.println("</head>");

	}

}
