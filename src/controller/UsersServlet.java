package controller;

import dao.UsersDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;


@WebServlet(asyncSupported = true, urlPatterns = { "/UsersServlet" })
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	UsersDAO usersDAO = new UsersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	session.invalidate();
    	response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                users.setUserID(new java.util.Date().getTime());
                users.setUserEmail(request.getParameter("email"));
                users.setUserPass(request.getParameter("pass"));
//                users.setUserPass(request.getParameter(MD5.encryption("pass")));
                users.setUserRole(false);
                usersDAO.insertUser(users);
                session.setAttribute("user", users);
                url = "/index.jsp";
                break;
            case "login":
                users = usersDAO.login(request.getParameter("email"), request.getParameter("pass"));
                System.out.println(request.getParameter("email"));
                System.out.println(request.getParameter("pass"));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = "/index.jsp";
                }else{
                    request.setAttribute("error", "Error email or password!");
                    url = "/login.jsp";
                }
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }
	
}
