package wx.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
指定编码
*/
@WebFilter(filterName = "encodingFilter")
public class encodingFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        request.setCharacterEncoding("UTF8");
        response.setContentType("application/json;charset=UTF8");
        chain.doFilter(request, response);

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
