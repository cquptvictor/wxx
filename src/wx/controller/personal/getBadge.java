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
import java.util.Map;

@WebServlet(name = "Servlet3")
public class getBadge extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId =(String) request.getSession().getAttribute("token");
        Service service = new Service();
        PrintWriter printWriter = response.getWriter();
        Map map = service.getBadge(openId);
        Gson gson = JsonUtils.getGson();
        printWriter.write("{'data':" +gson.toJson(map)+"}");

     }
}
