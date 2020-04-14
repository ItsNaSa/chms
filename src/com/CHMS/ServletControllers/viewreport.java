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

import com.CHMS.DAOfiles.viewreportDao;
import com.CHMS.JavaBeans.doctorReportRow;


@WebServlet("/viewreport")
public class viewreport extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession ses = request.getSession();
		String doc_reg_id = (String) ses.getAttribute("uname");
		
		java.util.Date today = new java.util.Date();
		
		viewreportDao nw=new viewreportDao();
		
		String sqlDate=request.getParameter("bday");
		
		List<doctorReportRow> treatmentRow = nw.show(doc_reg_id,sqlDate);
		request.setAttribute("T_ROW", treatmentRow);
		ses.setAttribute("PINFO", treatmentRow);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/viewreport.jsp");
		dispatcher.forward(request, response);
	}
}
