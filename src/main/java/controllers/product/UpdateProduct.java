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
    ProductService productService = null;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String productDecription = request.getParameter("productDescription");
        Product product = null;


        try {
            product = productService.read(productId);
            if (product != null) {
                product.setName(productName);
                product.setDescription(productDecription);
                if (productService.update(product)) {
                    request.getServletContext().setAttribute("type", "success");
                    request.getServletContext().setAttribute("message", "Product updated Successfully");
                    response.sendRedirect("list-product");
                }

            }
        } catch (SQLException e) {
            throw new ServletException("Error preforming this operation", e);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = null;

        int productId = Integer.parseInt(request.getParameter("productId"));
        try {
            product = productService.read(productId);
        } catch (SQLException e) {
            throw new ServletException("Retrieving product failed!", e);
        }
        request.setAttribute("product", product);
        request.getRequestDispatcher("/views/products/product-form.jsp").forward(request, response);
    }
}
