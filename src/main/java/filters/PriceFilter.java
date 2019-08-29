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
        if (request.getParameter("sellingPrice") != null) {

            double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
            double buyingPrice = Double.parseDouble(request.getParameter("buyingPrice"));
            if (sellingPrice > 0 && buyingPrice > 0) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
                httpServletResponse.getWriter().println("selling Price and Buying price should not be zero");
            }
        }else{
            filterChain.doFilter(servletRequest, servletResponse);

        }
    }
}
