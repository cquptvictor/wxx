package wx.controller.personal;

import com.google.gson.Gson;
import wx.service.Service;
import wx.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet13")
public class userBadge extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        String type = request.getParameter("type");
        String badge = request.getParameter("badge");
        PrintWriter printWriter = response.getWriter();
        Service service = new Service();
        if(service.addBadge(openId,badge,type))
            printWriter.write("{'static':1}");
        else
            printWriter.write("{'static':0}");
    }
}
