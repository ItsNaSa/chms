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
import com.CHMS.JavaBeans.Ratify;

/**
 * Servlet implementation class RatifyDoctor
 */
@WebServlet("/RatifyDoctor")
public class RatifyDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatifyDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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

	private void deleteDoctor(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		String docid = request.getParameter("docid");
		RevokeLoginDao rl= new RevokeLoginDao();
		rl.deleteRevokedDoctor(docid);
		listDoctors(request, response);
		
	}

	private void listDoctors(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		RevokeLoginDao rl= new RevokeLoginDao();
		List<Ratify> doctordetails = rl.showrevoked();	
		request.setAttribute("D_ROW",doctordetails);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ratify.jsp");
		dispatcher.forward(request, response);
		
	}		
}
	

	
