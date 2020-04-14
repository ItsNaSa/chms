package com.CHMS.ServletControllers;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CHMS.DAOfiles.AdminLoginDao;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		String uname = request.getParameter("uname");
		String password = request.getParameter("pass");
		System.out.println("Uname is "+uname+" Password is "+password);
		AdminLoginDao ald = new AdminLoginDao();
		
		if(ald.checkAdmin(uname, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("uname", uname);
			response.sendRedirect("welcomeadmin.jsp");
		}
		else {
			request.setAttribute("errorMessage", "Invalid Login ID or password");
            RequestDispatcher rd = request.getRequestDispatcher("/AdminLogin.jsp");
            rd.forward(request, response);
		}
		doGet(request, response);
	}

}
