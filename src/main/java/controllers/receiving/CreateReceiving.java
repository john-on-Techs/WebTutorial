package controllers.receiving;

import model.Product;
import model.Receiving;
import model.User;
import services.ProductService;
import services.ReceivingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "create-receiving", urlPatterns = "/create-receiving")
public class CreateReceiving extends HttpServlet {
    ProductService productService = null;
    ReceivingService receivingService = null;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        receivingService = new ReceivingService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int batchNo = Integer.parseInt(request.getParameter("batchNo"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
            double buyingPrice = Double.parseDouble(request.getParameter("buyingPrice"));
            User user = (User) request.getSession().getAttribute("user");
            Receiving receiving = new Receiving(batchNo, productId, quantity, buyingPrice, sellingPrice, user.getId());
            if (receivingService.create(receiving)) {
                response.sendRedirect("list-receivings");

            }
        } catch (SQLException |NumberFormatException e) {
           throw new ServletException("Some Error",e);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = null;
        try {
            products = productService.getProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/views/receivings/receiving-form.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving products", e);
        }
    }
}
