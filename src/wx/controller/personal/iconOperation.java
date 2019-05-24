package wx.controller.personal;

import wx.service.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet10")
public class iconOperation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operate = request.getParameter("operation");
        String label = request.getParameter("label");
        String name = request.getParameter("name");
        String openId = (String)request.getSession().getAttribute("token");
        Service service = new Service();
        PrintWriter printWriter = response.getWriter();

        if(service.operateIcon(openId,name,label,operate))
            printWriter.write("{'static':1}");
        else
            printWriter.write("{'static':0}");


    }
}
