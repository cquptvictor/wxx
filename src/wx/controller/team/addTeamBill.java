package wx.controller.team;

import wx.service.TeamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Parameter;

@WebServlet(name = "Servlet17")
public class addTeamBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        String nickName = request.getParameter("nickName");
        String amount = request.getParameter("amount");
        String tid = request.getParameter("tid");
        String label = request.getParameter("label");
        String remarks = request.getParameter("remarks");
        String time = request.getParameter("time");
        String type = request.getParameter("type");
        PrintWriter printWriter = response.getWriter();
        TeamService teamService = new TeamService();
        String bid = null;
        if((bid = teamService.addTeamBill(openId,nickName,amount,tid,label,remarks,time,type)) != null){
            printWriter.write("{'static':1,'bid':"+bid+"}");
        }else
            printWriter.write("{'static':0}");
    }
}
