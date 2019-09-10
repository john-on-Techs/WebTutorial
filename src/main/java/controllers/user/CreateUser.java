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

@WebServlet(name = "create-user", urlPatterns = "/create-user")
public class CreateUser extends HttpServlet {
    UserService userService =null;
    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String name = request.getParameter("username");
            User user =  new User(userId,name);
            if (userService.create(user)) {
                request.getServletContext().setAttribute("type","success");
                request.getServletContext().setAttribute("message","User created Successfully");
                response.sendRedirect("list-user");
            }
        } catch (SQLException e) {
           throw new ServletException("Could not create user",e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/users/user-form.jsp").forward(request, response);
    }
}
