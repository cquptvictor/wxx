package wx.controller;

import wx.service.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet8")
public class delBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bid = Integer.valueOf(request.getParameter("bid"));
        Service service = new Service();
        PrintWriter printWriter = response.getWriter();
        if(service.delBill(bid))
            printWriter.write("{'static':1}");
        else
            printWriter.write("{'static':0}");
    }
}
