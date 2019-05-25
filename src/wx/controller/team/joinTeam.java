package wx.controller.team;

import wx.domain.Team;
import wx.service.TeamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.print.PrinterAbortException;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet4")
public class joinTeam extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String) request.getSession().getAttribute("token");
        String isJoin = request.getParameter("isJoin");
        String tid = request.getParameter("tid");
        String name = request.getParameter("name");
        if(isJoin.equals(true))
        {
            PrintWriter printWriter = response.getWriter();
            TeamService teamService = new TeamService();
            if(teamService.addNewMember(openId,tid,name))
                printWriter.write("{'static':1}");
            else
                printWriter.write("{'static':0}");
        }

    }
}
