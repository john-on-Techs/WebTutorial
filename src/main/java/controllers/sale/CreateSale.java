package controllers.sale;

import model.Product;
import model.Sale;
import model.User;
import services.ProductService;
import services.SaleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="create-sale", urlPatterns = "/create-sale")
public class CreateSale extends HttpServlet {
    SaleService saleService =null;
    ProductService productService=null;
    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        saleService = new SaleService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            User user =(User) request.getSession().getAttribute("user");
            Sale sale = new Sale(productId,0.0,quantity,user.getId());
            if(saleService.create(sale)){
                response.sendRedirect("list-sale");
            }
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("Some Error",e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Product> products = null;
        try {
            products = productService.getProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/views/sales/sale-form.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error retrieving products", e);
        }

    }
}
