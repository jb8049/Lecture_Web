package kr.ac.kopo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	/*
	 * @Override public void init(ServletConfig config) throws ServletException {
	 * System.out.println("init() 최초 한 번만 실행되는 메소드 입니다."); }
	 */
	
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //클라이언트가 서버에게 요청하는 request객체, 요청과 관련된 것들 가지고 있음, response객체가 html문서를 클라이언트에게 넘겨준다 
		 																												// IOException이 있는 이유는 소켓 통신, 인풋 아웃풋 스트림이 만들어짐 => checked 예외니까 예외처리 해야함
		System.out.println("service() : 실제 작업이 실행되는 메소드입니다.");
		System.out.println("사용자가 요청할 때마다 호출되는 메소드입니다.");
		
	
	}
	
	
	
	
}