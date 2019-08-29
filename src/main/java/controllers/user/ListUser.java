package controllers.user;

import model.User;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "list-user",urlPatterns = "/list-user")
public class ListUser extends HttpServlet {
    UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            List<User> users = userService.getUsers();
            request.setAttribute("users",users);
            request.getRequestDispatcher("/views/users/list-user.jsp").forward(request,response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving users",e);
        }
    }
}
