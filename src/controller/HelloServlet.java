package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(
			HttpServletRequest req, HttpServletResponse resp) 
					throws ServletException, IOException {
		req.setAttribute("message", "링크가 젤다인가요?");
		req.getRequestDispatcher("/HelloWorld.jsp").forward(req, resp);
	}
	
}
