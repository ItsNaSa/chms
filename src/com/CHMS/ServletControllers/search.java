package com.CHMS.ServletControllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CHMS.DAOfiles.personDao;
import com.CHMS.JavaBeans.Treatment;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet 
{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String aadharid = request.getParameter("aadharid");
		HttpSession ses = request.getSession();
		ses.setAttribute("aadharid", aadharid);
		personDao ld = new personDao();
		
		if(!ld.validate(aadharid)) {
            request.setAttribute("errorMessage", "Invalid Aadhar");
            RequestDispatcher rd = request.getRequestDispatcher("/fetchdetails.jsp");
            rd.forward(request, response);			
		}
		
		List<Treatment> treatments = ld.getTreatmentList(aadharid);
		request.setAttribute("p_aadharid", aadharid);
		request.setAttribute("T_LIST", treatments);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/history.jsp");
		dispatcher.forward(request, response);
	
	}

}
