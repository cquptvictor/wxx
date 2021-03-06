package wx.controller.team;

import com.google.gson.Gson;
import wx.domain.team.Team;
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

/*
获取这个人所加入的团队
*/
@WebServlet(name = "Servlet15")
public class getTeam extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        String page = request.getParameter("page");
        TeamService teamService = new TeamService();
        List<Team> list = teamService.getTeam(openId,page);
        Gson gson = JsonUtils.getGson();
        PrintWriter printWriter = response.getWriter();
        if(list != null)
            printWriter.write(gson.toJson(list));
        else
            printWriter.write(gson.toJson("{'data':[]}"));

    }
}
