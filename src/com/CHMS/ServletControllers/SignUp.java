package com.CHMS.ServletControllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CHMS.DAOfiles.SignUpDao;
import com.CHMS.DAOfiles.personDao;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String aadharid = request.getParameter("aadharid");
		String regid = request.getParameter("regid");
		String pass = request.getParameter("pass");
		String token = request.getParameter("token");
		String degree = request.getParameter("degree");
		String city = request.getParameter("city");
		
		personDao ld = new personDao();
		if(!ld.validate(aadharid)) 
		{
            request.setAttribute("errorMessage1", "Invalid Aadhar");
            		
		}
		
		SignUpDao su = new SignUpDao();
		if(!su.validate(token)) 
		{
            request.setAttribute("errorMessage2", "Invalid Authetication Token");		
		}
		
		if(!su.validate(token) || !ld.validate(aadharid)) {
			RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
            rd.forward(request, response);	
		}
		
		else
		{
		su.register(aadharid, regid, pass,degree,city);
		request.setAttribute("errorMessage", "Registration done");
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
		}
		
	}

}
