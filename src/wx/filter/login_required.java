package wx.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "Filter")
public class login_required implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        if(request.getSession().getAttribute("token") != null)
            chain.doFilter(request, response);
        else
        {
            response.getWriter().write("{'state':401}");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
