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

@WebServlet(name = "delete-user", urlPatterns = "/delete-user")
public class DeleteUser extends HttpServlet {
    UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            User user;
            user = userService.read(userId);

            if (userService.delete(user)) {
                request.getServletContext().setAttribute("type","success");
                request.getServletContext().setAttribute("message","User deleted Successfully");
                response.sendRedirect("list-user");
            }
        } catch (SQLException e) {
            throw new ServletException("Retrieving user failed!", e);
        }

    }


}
