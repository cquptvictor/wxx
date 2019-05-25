package wx.controller.team;

import wx.service.TeamService;
import wx.utils.auth.isAdministrator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet20")
public class leaveTeam extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId =(String)request.getSession().getAttribute("token");
        String tid = request.getParameter("tid");
        String uid = request.getParameter("uid");
        String name = request.getParameter("name");
        String operator = request.getParameter("operator");
        PrintWriter printWriter = response.getWriter();
        TeamService teamService = new TeamService();
        if(uid == null)//为空表示是退出团队
        {
            if(teamService.leaveTeam(tid,openId,name))
                printWriter.write("{'static':1}");
            else
                printWriter.write("{'static':0}");
        }else{
                if(isAdministrator.auth(openId,tid) && teamService.kickOut(tid,openId,uid,name,operator))
                    printWriter.write("{'static':1}");
                else
                    printWriter.write("{'static':0}");
        }
    }
}
