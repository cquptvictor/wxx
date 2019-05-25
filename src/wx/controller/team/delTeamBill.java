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

@WebServlet(name = "Servlet19")
public class delTeamBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        String bid = request.getParameter("bid");
        String tid = request.getParameter("tid");
        String name = request.getParameter("name");
        String amount = request.getParameter("amount");
        String label = request.getParameter("label");
        PrintWriter printWriter = response.getWriter();
        TeamService teamService = new TeamService();
        if(isAdministrator.auth(openId,tid) && teamService.delTeamBill(tid,bid,name,amount,label)){
            printWriter.write("{'static':1}");
        }else
            printWriter.write("{'static':0}");
    }
}
