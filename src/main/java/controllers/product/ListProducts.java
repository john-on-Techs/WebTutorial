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
import java.util.ArrayList;

@WebServlet(name = "list-product", urlPatterns = "/list-product")
public class ListProducts extends HttpServlet {
    private ProductService productDao = null;

    @Override
    public void init() throws ServletException {
        productDao = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<Product> products = productDao.getProducts(); // Obtain all products.
            request.setAttribute("products", products); // Store products in request scope.
            request.getRequestDispatcher("/views/products/list-product.jsp").forward(request, response); // Forward to JSP page to display them in a HTML table.
        } catch (SQLException e) {
            throw new ServletException("Retrieving products failed!", e);
        }
    }
}






    /*

            String name="user";
        String value="john";
        Cookie myCookie =  new Cookie(name, value);




    Cookie[] ck = request.getCookies();
    boolean hasCokie =false;
        for(Cookie cookie:ck){
                if(myCookie.getName().equals(cookie.getName()) && myCookie.getValue().equals(cookie.getValue())){
                hasCokie = true;
                }
                }
                if(!hasCokie){
                response.addCookie(myCookie);
                }
*/