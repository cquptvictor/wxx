package wx.controller.team;

import com.google.gson.Gson;
import wx.service.TeamService;
import wx.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Servlet22")
public class getInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tid = request.getParameter("tid");
        String page = request.getParameter("page");
        TeamService teamService = new TeamService();
        List list = teamService.getInfo(tid,page);
        PrintWriter printWriter = response.getWriter();
        Gson gson = JsonUtils.getGson();
        printWriter.write("{'data':"+gson.toJson(list)+"}");
    }
}
