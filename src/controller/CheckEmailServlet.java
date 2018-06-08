package controller;
import dao.UsersDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(asyncSupported = true, urlPatterns = { "/CheckEmailServlet" })
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsersDAO usersDAO = new UsersDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (usersDAO.checkEmail(request.getParameter("username"))) {
            response.getWriter().write("<img src=\"img/not-available.png\" />");
        } else {
            response.getWriter().write("<img src=\"img/available.png\" />");
        }
	}

}
