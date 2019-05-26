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

@WebServlet(name = "Servlet14")
public class setTeam extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        //获取团队名和创建者的用户名
        String teamName = request.getParameter("tname");
        String uname = request.getParameter("uname");
        TeamService teamService = new TeamService();
        //获取返回的团队id
        String id = teamService.createTeam(openId,teamName,uname);
        PrintWriter printWriter = response.getWriter();
        printWriter.write("{'tid':\""+id+"\"}");
    }
}
