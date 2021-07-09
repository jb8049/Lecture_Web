package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
// http://localhost:9999/Lecture-Web/servlet/table?row=4&col=3 요청시
// 
	------------------------------------
	|cell(0,0) | cell(0,1) | cell(0,2) |
	------------------------------------
	|cell(1,0) | cell(1,1) | cell(1,2) |
	------------------------------------
	|cell(2,0) | cell(2,1) | cell(2,2) |
	------------------------------------
	|cell(3,0) | cell(3,1) | cell(3,2) |
	------------------------------------ 
// http://localhost:9999/Lecture-Web/servlet/table 아무것도 입력하지 않으면 5*5 테이블 생성

// http://localhost:9999/Lecture-Web/servlet/table?row=2 요청 시 2*5 테이블 생성
 
*/

@WebServlet("/tableExam")  // 여기에 들어오면,아래의 서비스가 처리하겠다는 것, 가상의 URL이 겹치면 안됨!!!
						   // http://localhost:9999/Lecture-Web/tableExam 이렇게 접속 가능
public class TableServlet extends HttpServlet {
	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int row = 5;
		int col = 5;
		
		String rowStr = request.getParameter("row");  //null일 수 있어서.. 바로 parseInt 안썼음!!!
		String colStr = request.getParameter("col");
		
		if(rowStr !=null) {
			row = Integer.parseInt(rowStr);
		}
		col = colStr == null ? 5 : Integer.parseInt(colStr);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head><title>테이블생성</title>");
		
		sb.append("<style>");

		sb.append("</style>");
		
		sb.append("</head>");
		
		
		
		sb.append("<body>"); 
		
		sb.append("<table border = '1'>");
		
		for(int i=0; i <row; i++) {
			sb.append("<tr>");
			for(int j=0; j <col; j++) {
				sb.append("<td>");
				sb.append("cell( " +i + ", " + j +")");
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		
		sb.append("</table>");
		
		sb.append("</body>"); 
		sb.append("</html>");
		out.println(sb);
		
	}

//	@Override
//	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		// 행과 열을 추출
//		
//		int row =Integer.parseInt(request.getParameter("row"));
//		int col =Integer.parseInt(request.getParameter("col"));
//		
//		
//		PrintWriter out = response.getWriter(); //리턴 타입 PrintWriter
//		out.println("<html>");
//		out.println("	<head>");
//		out.println("		<title>행렬입니다.</title>");
//		out.println("   </head>");
//		out.println("   <body>");
//		out.println("===========================<br>");
//		out.println("<table>");
//		
//		for(int i =0; i < row; i++) {
//			out.println("<tr>");
//			for(int j=0; j <col; j++) {	
//				out.println("<td>cell("+ i + "," + j +")</td>");
//			}
//			out.print("</tr>");
//		}
//		out.println("</table>");
//		out.println("===========================<br>");
//		out.println("   </body>");
//		out.println("</html>");
//		
//	}
	
	
	
	
	
	

}
