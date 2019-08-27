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

@WebServlet(name = "update-product",urlPatterns = "update-product")
public class UpdateProductController extends HttpServlet {
    ProductDao productDao =null;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String productDecription = request.getParameter("productDescription");
        Product product = new Product(productId, productName, productDecription);
        System.out.println(product);
        try {
            productDao.update(product);
            response.sendRedirect("list-product");
        } catch (SQLException e) {
            throw new ServletException("Retrieving product failed!", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = null;

        int productId = Integer.parseInt(request.getParameter("productId"));
        try {
            product = productDao.read(productId);
        }catch (SQLException e) {
            throw new ServletException("Retrieving product failed!", e);
        }
        request.setAttribute("product",product);
        request.getRequestDispatcher("/views/product-form.jsp").forward(request, response);
    }
}
