package com.CHMS.ServletControllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CHMS.DAOfiles.newrecordDao;

@WebServlet("/NewPrescription")
public class NewPrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NewPrescription() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String[] med=request.getParameterValues("medicineList");
		String[] dosage = new String[med.length];
		
		for(int i =0 ; i < med.length;i++) 
		{
			dosage[i] = (String)request.getParameter(med[i]);
		}
		
		String diagnosis = request.getParameter("diagnosis");
		HttpSession ses = request.getSession();
		String doc_reg_id = (String) ses.getAttribute("uname");
		String p_aadharid = (String) ses.getAttribute("aadharid");
		
		java.util.Date today = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date( today.getTime() );
								
		request.setAttribute("medicines", med);
		request.setAttribute("dosages", dosage);
		
		newrecordDao nw=new newrecordDao();
		int treatmentID=nw.insert(diagnosis,doc_reg_id,p_aadharid,sqlDate,med);
		ses.setAttribute("treatmentID", treatmentID);
		
		System.out.println(treatmentID);
		
		RequestDispatcher rd = request.getRequestDispatcher("/createdPrescription.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
