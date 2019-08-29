package controllers.receiving;

import model.Receiving;
import services.ReceivingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet(name="list-receivings",urlPatterns = "/list-receivings")
public class ListReceiving extends HttpServlet {
    ReceivingService receivingService = null;

    @Override
    public void init() throws ServletException {
        receivingService = new ReceivingService();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Receiving> receivings = receivingService.getReceivings();
            request.setAttribute("receivings", receivings);
            request.getRequestDispatcher("/views/receivings/list-receiving.jsp").forward(request, response);


        } catch (SQLException e) {
            throw new ServletException("Error retrieving receivings", e);
        }
    }
}
