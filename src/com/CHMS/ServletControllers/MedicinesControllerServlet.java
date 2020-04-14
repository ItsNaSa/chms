package com.CHMS.ServletControllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CHMS.DAOfiles.medicineDAO;
import com.CHMS.JavaBeans.Medicine;

/**
 * Servlet implementation class MedicinesControllerServlet
 */
@WebServlet("/MedicinesControllerServlet")
public class MedicinesControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MedicinesControllerServlet() {
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
			
			// if the command is missing, then default to listing students
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			// route to the appropriate method
			switch (theCommand) {
			
			case "LIST":
				listMedicines(request, response);
				break;
				
			case "ADD":
				addMedicines(request, response);
				break;
				
			case "LOAD":
				loadMedicines(request, response);
				break;
				
			case "UPDATE":
				updateMedicines(request, response);
				break;
				
			default:
				listMedicine(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}		
	}

	private void listMedicine(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void updateMedicines(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int medicineID=Integer.parseInt(request.getParameter("medicineID"));
		String common_name=request.getParameter("common_name");
		String basic_drug=request.getParameter("basic_drug");
		
		Medicine medicine = new Medicine(medicineID, common_name, basic_drug);
		medicineDAO md = new medicineDAO();
		md.updatemedicine(medicine);
		listMedicines(request, response);
		
	}

	private void loadMedicines(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int medicineID = Integer.parseInt(request.getParameter("medicineID"));
		
		medicineDAO md = new medicineDAO();
		Medicine medicine = md.getmedicine(medicineID);
		request.setAttribute("M_ROW", medicine);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/updatemedicine.jsp");
		dispatcher.forward(request, response);			
		
		
	}

	private void addMedicines(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String basic_drug = request.getParameter("basic_drug");
		String common_name = request.getParameter("common_name");
		
		Medicine medicine = new Medicine(common_name, basic_drug);
		medicineDAO md = new medicineDAO();
		md.addmedicine(medicine);
		
		
		listMedicines(request, response);
		
	}

	private void listMedicines(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		medicineDAO md = new medicineDAO();
		List<Medicine> medicines = md.getmedicines();
		request.setAttribute("M_ROW", medicines);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/medicines.jsp");
		dispatcher.forward(request, response);				
	}		
}

