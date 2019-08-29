package controllers.product;

import services.ProductService;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "delete-product",urlPatterns = "/delete-product")
public class DeleteProduct extends HttpServlet {
    ProductService productDao =null;

    @Override
    public void init() throws ServletException {
        productDao = new ProductService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product product =null;
        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            //System.out.println(productId);
             product = productDao.read(productId);


        } catch (SQLException e) {
           throw  new ServletException("Error retrieving product",e);
        }
        try {
            productDao.delete(product);
            resp.sendRedirect("list-product");
        } catch (SQLException e) {
            throw  new ServletException("Error deleting product",e);
        }

    }
}
