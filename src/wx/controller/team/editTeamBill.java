package wx.controller.team;

import wx.service.TeamService;
import wx.utils.editionAuth;
import wx.utils.isAdministrator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet21")
public class editTeamBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String openId = (String)request.getSession().getAttribute("token");
            String tid = request.getParameter("tid");
            String bid = request.getParameter("bid");
            PrintWriter printWriter =response.getWriter();
            //验证是否有相应权限
            if(editionAuth.auth(openId,tid,bid)) {
                String remarks = request.getParameter("remarks");
                String nickName = request.getParameter("nickName");
                String  amount = request.getParameter("amount");
                String label = request.getParameter("label");
                TeamService teamService = new TeamService();
                if(teamService.editTeamBill(tid,bid,nickName,amount,label,remarks))
                    printWriter.write("{'static':1}");
                else
                    printWriter.write("{'static':0}");
            }else{
                response.setStatus(401);
                printWriter.write("401 Unauthorized");
            }
    }
}
