package controllers.user;

import model.Product;
import model.User;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "update-user",urlPatterns = "/update-user")
public class UpdateUser extends HttpServlet {
    UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String username = request.getParameter("username");

            User user = userService.read(userId);
            if (user != null) {
                user.setName(username);
                if (userService.update(user)) {
                    response.sendRedirect("list-user");
                }
            }

        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("Some Error occurred", e);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = null;

        int userId = Integer.parseInt(request.getParameter("userId"));
        try {
            user = userService.read(userId);
        } catch (SQLException e) {
            throw new ServletException("Retrieving user failed!", e);
        }
        request.setAttribute("dbUser", user);
        request.getRequestDispatcher("/views/users/user-form.jsp").forward(request, response);
    }
}
