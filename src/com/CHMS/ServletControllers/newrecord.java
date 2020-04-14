package com.CHMS.ServletControllers;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CHMS.DAOfiles.newrecordDao;

@WebServlet("/newrecord")
public class newrecord extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String diagnosis = request.getParameter("diagnosis");
		HttpSession ses = request.getSession();
		String doc_reg_id = (String) ses.getAttribute("uname");
		String p_aadharid = (String) ses.getAttribute("aadharid");
		
		java.util.Date today = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date( today.getTime() );
		
		newrecordDao nw=new newrecordDao();
//		nw.insert(diagnosis,doc_reg_id,p_aadharid,sqlDate);
		
	}

}
