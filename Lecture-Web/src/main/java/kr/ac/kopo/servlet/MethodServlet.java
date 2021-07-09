package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet {

	//GET http://localhost:9999/Lecture-Web/method?id=aaa => 사용자의 id=aaa이런거 추출하고 싶다,
	//request를 통해서 날아옴! 여기서 뽑아야지
	
	
//	반드시 서비스 메소드는 만들어줘야함
//	서비스를 get과 post로 처리할 수 있음
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		
				System.out.println("doGet() 호출");					
				// method.html을 실행하면, 이 서블릿이 실행됨
				// request가 요청정보를 알고있음
				// 서버입장에서 요청이 날아온 것을 분석해보기
				
				String method = request.getMethod(); //어떤 메소드 형태로 호출되는지 알려주는 것 get, post
				StringBuffer url= request.getRequestURL(); // 프로토콜까지 포함한 URL, 스트링버퍼형식(주소에 더하기 해준 것)
				String uri = request.getRequestURI();
				
//				System.out.println("method : " + method);
				System.out.println("url : " + url.toString());
				System.out.println("uri : " + uri);
				
				//사용자가 입력한 아이디 request에서 뽑아내기 
				String id = request.getParameter("id");
				
//				System.out.println("id : " + id);
				
				// 사용자가 입력한 id를 받았으니까, 이제 response 해주자
				
				// 클라이언트에게 응답
				
				// 한글 깨지는 부분 해결
				response.setContentType("text/html; charset=utf-8");
				
				PrintWriter out = response.getWriter(); //리턴 타입 PrintWriter
				out.println("<html>");
				out.println("	<head>");
				out.println("		<title>메소드 호출방식</title>");
				out.println("   </head>");
				out.println("   <body>");
				out.println("=============================================<br>");
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 요 청 결 과<br>");
				out.println("=============================================<br>");
				out.println("파라미터(id) : " + id + "<br>");
				out.println("요청방식 : " + method + "<br>");
				out.println("요청 URI : " + uri + "<br>");
				out.println("요청 URL : " + url+ "<br>");
				out.println("=============================================<br>");
				out.println("   </body>");
				out.println("</html>");
				
				out.flush();
				out.close();
				// 이렇게 하고 method.html 실행하면, 빈 화면인데 소스보기 눌러보면 날라오는거 확인가능!
				// 한글이 깨져 나오는데 설정해주어야함 setContentType
				// 일일이 문자열로 html로 쓰고 있는데... 오타나면?.. 이래서 서블릿이 프레젠테이션(화면 구성) 문제가 있다는 것이다
				

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			  
		//바디에 들어가는 한글을 utf-8 방식으로 인코딩! 해야함
		request.setCharacterEncoding("utf-8");
		
		String method = request.getMethod();
		String uri = request.getRequestURI();
		String id = request.getParameter("id");
		
		
		System.out.println("method : " + method);
		System.out.println("uri : " + uri);
		
		//html문서이고, utf-8 방식을 출력할꺼야
		response.setContentType("text/html; charset=utf-8");
		
		//화면에 출력하기 위해 response 객체를 통해 io 얻어오기
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>메소드 호출방식 - POST</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("=============================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 요 청 결 과<br>");
		out.println("=============================================<br>");
		out.println("요청 URI : " + uri +"<br>");
		out.println("요청 메소드 : "+ method + "<br>");
		out.println("파라미터(id) : " + id + "<br>"); 
		out.println("=============================================<br>");

		out.println("</body>");
		out.println("</head>");  
		
		// post 방식에서 아이디로 홍길동 한글로 하니까 깨져서 화면에 출력됨
		// get 방식에서 url을 복사해서 보면..http://localhost:9999/Lecture-Web/method?id=%ED%99%8D%EA%B8%B8%EB%8F%99
		// 크롬이 똑똑해서 저거를 한글로 인식함, 실제로 날아가는 것은 저렇게 날아감
		// post 방식에서는 한글을 올바르게 인식하기 위해 설정해주어야함 getChar~
		
		
	}
	
	
	
	
	

}
