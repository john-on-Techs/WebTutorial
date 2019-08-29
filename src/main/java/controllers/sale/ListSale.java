package controllers.sale;

import model.Receiving;
import model.Sale;
import services.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet( name = "list-sale",urlPatterns = "/list-sale")
public class ListSale extends HttpServlet {
    SaleService saleService = null;
    @Override
    public void init() throws ServletException {
        saleService = new SaleService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Sale> sales = saleService.getSales();
            request.setAttribute("sales", sales);
            request.getRequestDispatcher("/views/sales/list-sales.jsp").forward(request, response);


        } catch (SQLException e) {
            throw new ServletException("Error retrieving Sales", e);
        }
    }
}
