package controllers.accounts;

import model.User;
import services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "login",urlPatterns = "/login")
public class Login extends HttpServlet {
    private UserService userService = null;
    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/accounts/login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try{
            int id = Integer.parseInt(req.getParameter("user-id"));
            String username = req.getParameter("username");
            User user;
            user = userService.read(id);
            if(user != null && user.getName().equals(username)){

                    HttpSession session = req.getSession();
                    session.setAttribute("user",user);
                    RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                    rd.include(req, resp);

            }else{
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/accounts/login.jsp");

                req.setAttribute("type","error");
                req.setAttribute("message","User with the supplied ID does not exist");
                requestDispatcher.forward(req, resp);
            }
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("Some error occurred",e);
        }

    }
}
