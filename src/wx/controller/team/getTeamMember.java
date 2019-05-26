package wx.controller.team;

import com.google.gson.Gson;
import wx.domain.TeamMember;
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

@WebServlet(name = "Servlet18")
public class getTeamMember extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tid = request.getParameter("tid");
        String page = request.getParameter("page");
        Gson gson = JsonUtils.getGson();
        PrintWriter printWriter = response.getWriter();
        TeamService teamService = new TeamService();
        List<TeamMember> list = teamService.getTeamMember(tid,page);
        printWriter.write("{'data':"+gson.toJson(list)+"}");
    }
}
