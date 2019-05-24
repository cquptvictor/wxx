package wx.team;

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

@WebServlet(name = "Servlet14")
public class setTeam extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        String teamName = (String)request.getSession().getAttribute("name");
        TeamService teamService = new TeamService();
        Gson gson = JsonUtils.getGson();
        //获取返回的团队名
        String id = teamService.createTeam(openId,teamName);
        PrintWriter printWriter = response.getWriter();
        printWriter.write(gson.toJson("{'tid':"+id+"}"));
    }
}
