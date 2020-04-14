package com.CHMS.ServletControllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CHMS.DAOfiles.AddDoctorAdminDao;

/**
 * Servlet implementation class AddDoctorAdminServlet
 */
@WebServlet("/AddDoctorAdminServlet")
public class AddDoctorAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctorAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String DoctorId = request.getParameter("doctor_id");
		String AuthenticationKey = request.getParameter("new_key");
		AddDoctorAdminDao newDoctor = new AddDoctorAdminDao();
		if(newDoctor.addDoctor(DoctorId, AuthenticationKey)) {
			RequestDispatcher rd=request.getRequestDispatcher("/showAuthenticationKey.jsp");
			request.setAttribute("AuthenticationKey", AuthenticationKey);
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/welcomeadmin.jsp");
			request.setAttribute("errorMessage", "Some error occured!");
			rd.forward(request, response);
		}
		
		doGet(request, response);
	}

}
