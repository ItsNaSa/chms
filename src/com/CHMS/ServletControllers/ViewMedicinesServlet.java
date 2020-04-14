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
 * Servlet implementation class ViewMedicinesServlet
 */
@WebServlet("/ViewMedicinesServlet")
public class ViewMedicinesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMedicinesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		medicineDAO md = new medicineDAO();
		List<Medicine> medicines = md.getmedicines();
		request.setAttribute("M_ROW", medicines);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/viewmedicines.jsp");
		dispatcher.forward(request, response);				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
