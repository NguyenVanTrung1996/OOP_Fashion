package controller;

import dao.ChartDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChartServlet")
public class ChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ChartDAO chartDAO = new ChartDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("listItem", chartDAO.getAll());
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/manager_chart.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
