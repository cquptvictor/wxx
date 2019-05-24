package wx.controller.personal;

import com.google.gson.Gson;
import wx.service.Service;
import wx.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet5")
public class addBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String openId = (String)session.getAttribute("token");
       // String openId= "oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg";
        String isSignIn = (String)session.getAttribute("isSignIn");

        String label = request.getParameter("label");
        String type = request.getParameter("type");
        String remarks = request.getParameter("remarks");
        String time = request.getParameter("time");
        float amount = Float.valueOf(request.getParameter("amount"));
        Service service = new Service();
        Gson gson = JsonUtils.getGson();
        PrintWriter printWriter = response.getWriter();
        if( isSignIn.equals("false")) {
           if(service.signIn(openId)) {
                session.setAttribute("isSignIn", "true");
           }
           }
        //每天的第一笔帐要发送一个额外的参数
        if(openId != null && service.addBill(openId,label,remarks,time,amount,type))
            if(isSignIn.equals("true"))
                printWriter.write(gson.toJson("{'static':1}"));
             else
                printWriter.write(gson.toJson("{'static':1,'isSignIn':true}"));

        else
            printWriter.write(gson.toJson("{'static':0}"));

    }
}
