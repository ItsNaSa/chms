package com.CHMS.ServletControllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CHMS.DAOfiles.loginDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet 
{
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
				
		loginDao ld = new loginDao();
		if(!(ld.verify(uname)))
		{
			if(ld.check(uname, pass)) 
			{
				HttpSession session = request.getSession();
				session.setAttribute("uname", uname);
				response.sendRedirect("welcome.jsp");
			}
			else 			
			{
	            request.setAttribute("errorMessage", "Invalid username or password");
	            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
	            rd.forward(request, response);
			}
		}			
		else 			
		{
            request.setAttribute("errorMessage", "Invalid username or password");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
		}
	}
}
