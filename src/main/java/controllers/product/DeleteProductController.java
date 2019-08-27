package controllers.product;

import dao.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "delete-product",urlPatterns = "/delete-product")
public class DeleteProductController extends HttpServlet {
    ProductDao productDao =null;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            Product product = productDao.read(productId);
            productDao.delete(product);
            resp.sendRedirect("list-product");
        } catch (SQLException e) {
           throw  new ServletException("Error retrieving product",e);
        }

    }
}
