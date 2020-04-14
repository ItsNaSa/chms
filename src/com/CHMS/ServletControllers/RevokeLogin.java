package com.CHMS.ServletControllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CHMS.DAOfiles.RevokeLoginDao;
import com.CHMS.JavaBeans.Revoke;

@WebServlet("/RevokeLogin")
public class RevokeLogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

    public RevokeLogin() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			
		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");
			
			
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			// route to the appropriate method
			switch (theCommand) {
			
			case "LIST":
				listDoctors(request, response);
				break;
				
			case "DELETE":
				deleteDoctor(request, response);
				break;
				
				
			default:
				listDoctors(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	private void deleteDoctor(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String docid = request.getParameter("docid");
		RevokeLoginDao rl= new RevokeLoginDao();
		rl.deleteDoctor(docid);
		listDoctors(request, response);
		
	}

	private void listDoctors(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		RevokeLoginDao rl= new RevokeLoginDao();
		List<Revoke> doctordetails = rl.show();	
		request.setAttribute("D_ROW",doctordetails);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/revokelogin.jsp");
		dispatcher.forward(request, response);
		
	}							
}
