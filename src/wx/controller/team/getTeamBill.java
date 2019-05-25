package wx.controller.team;

import com.google.gson.Gson;
import wx.domain.TeamBill;
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

@WebServlet(name = "Servlet16")
public class getTeamBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        String tid = request.getParameter("tid");
        String  page = request.getParameter("page");
        PrintWriter printWriter = response.getWriter();
        Gson gson = JsonUtils.getGson();
        TeamService teamService = new TeamService();
        List<TeamBill> list = teamService.getTeamBill(tid,page,openId);
        printWriter.write("{'data':["+gson.toJson(list)+"]}");
    }
}
