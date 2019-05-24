package wx.controller.personal;

import com.google.gson.Gson;
import wx.service.Service;
import wx.utils.TimeUtils;
import wx.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

@WebServlet(name = "Servlet9")
public class Graph extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        String category = request.getParameter("category");
        String label = request.getParameter("isLabel");
        Service service = new Service();
        PrintWriter printWriter = response.getWriter();
        Gson gson = JsonUtils.getGson();
        int offset = Integer.valueOf(request.getParameter("offset"));

        Date beginTime = null;
        if(category.equals("week"))
            beginTime = TimeUtils.getWeek(offset);
        else if(category.equals("month")) {
            beginTime = TimeUtils.getMonth(offset);
            System.out.println(beginTime);
        }
        else if (category.equals("year"))
            beginTime = TimeUtils.getYear(offset);
        else
            printWriter.write("{'static':0}");
        Map map = service.linerGraphsService(category,beginTime,openId,label);
        printWriter.write("{'data':" +gson.toJson(map)+"}");
    }
}
