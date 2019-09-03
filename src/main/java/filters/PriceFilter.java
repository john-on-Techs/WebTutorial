package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/create-receiving")
public class PriceFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        if (request.getParameter("sellingPrice") != null) {

            double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
            double buyingPrice = Double.parseDouble(request.getParameter("buyingPrice"));

            if (sellingPrice > 0.0 && buyingPrice > 0.0) {
                System.out.println(sellingPrice+" " +buyingPrice);
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                request.setAttribute("type","error");
                request.setAttribute("message","Selling Price and Buying Price should be greater than zero");
                request.getRequestDispatcher("/views/receivings/receiving-form.jsp").forward(request,response);
            }
        }else{
            filterChain.doFilter(servletRequest, servletResponse);

        }
    }
}
