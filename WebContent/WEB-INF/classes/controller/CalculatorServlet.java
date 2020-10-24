package controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculatorServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		
		//사용자 입력 혹은 선택값 받기]
		int first = Integer.parseInt(req.getParameter("firstNum"));
		int second = Integer.parseInt(req.getParameter("secondNum"));
		String op = req.getParameter("operator");
		
		int result;
		switch(op) {
		case "+":
			result = first+second;
			break;
		case "-":
			result = first-second;
			break;
		case "*":
			result = first*second;
			break;
		default:
			result = first/second;
		}
		//리퀘스트 영역에 결과 값 저장]
		req.setAttribute("result", result);
		//포워드]
		req.getRequestDispatcher("/HelloWorld.jsp").forward(req, resp);
	}
}
