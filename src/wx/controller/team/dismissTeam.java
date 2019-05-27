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

@WebServlet(name = "Servlet11")
public class dismissTeam extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String tid = request.getParameter("tid");
        String openId = (String)request.getSession().getAttribute("token");
        PrintWriter printWriter = response.getWriter();
        //只有管理员才可以解散团队
        if(isAdministrator.auth(openId,tid)){
            TeamService teamService = new TeamService();
            if(teamService.dismissTeam(tid))
                printWriter.write("{'static':1}");
            else
                printWriter.write("{'static':0}");
        }else
            printWriter.write("{'static':0}");
    }
}
