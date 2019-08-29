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

@WebServlet(name = "create-product", urlPatterns = "/create-product")
public class CreateProduct extends HttpServlet {
    ProductService productService = null;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/views/products/product-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            String productName = req.getParameter("productName");
            String productDecription = req.getParameter("productDescription");
            Product product = new Product(productId, productName, productDecription);
            if( productService.create(product)){
                resp.sendRedirect("list-product");
            }
        } catch (SQLException |NumberFormatException e) {
            throw new ServletException("creating products failed!", e);
        }
    }

}

