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

@WebServlet(name = "delete-product", urlPatterns = "/delete-product")
public class DeleteProduct extends HttpServlet {
    ProductService productService = null;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product product = null;
        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            //System.out.println(productId);
            product = productService.read(productId);
            if (product != null) {
                if (productService.delete(product)) {
                    req.getServletContext().setAttribute("type", "success");
                    req.getServletContext().setAttribute("message", "Product deleted Successfully");
                    resp.sendRedirect("list-product");
                }
            }


        } catch (SQLException e) {
            throw new ServletException("Error performing this operation", e);
        }


    }
}
