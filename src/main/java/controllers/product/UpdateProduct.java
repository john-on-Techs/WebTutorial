package controllers.product;

import model.Product;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "update-product", urlPatterns = "update-product")
public class UpdateProduct extends HttpServlet {
    ProductService productDao = null;

    @Override
    public void init() throws ServletException {
        productDao = new ProductService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String productDecription = request.getParameter("productDescription");
        Product product = null;


        try {
            product = productDao.read(productId);
        } catch (SQLException e) {
            throw new ServletException("Retrieving product failed!", e);
        }

        if (product != null) {
            product.setName(productName);
            product.setDescription(productDecription);

            try {
                productDao.update(product);
                response.sendRedirect("list-product");
            } catch (SQLException e) {
                throw new ServletException("Updating product failed!", e);
            }
        } else {
            //notofy the user that the product was not updated
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = null;

        int productId = Integer.parseInt(request.getParameter("productId"));
        try {
            product = productDao.read(productId);
        } catch (SQLException e) {
            throw new ServletException("Retrieving product failed!", e);
        }
        request.setAttribute("product", product);
        request.getRequestDispatcher("/views/products/product-form.jsp").forward(request, response);
    }
}
