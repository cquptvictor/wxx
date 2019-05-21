package wx.controller;

import wx.service.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet7")
public class editBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String bid = request.getParameter("bid");
            String amount = request.getParameter("amount");
            String label = request.getParameter("label");
            String reamrks = request.getParameter("remarks");
            String time = request.getParameter("time");
            String type = request.getParameter("type");

            Service service = new Service();
            PrintWriter printWriter = response.getWriter();
            if(service.editBill(Integer.valueOf(bid), Float.valueOf(amount), label, reamrks, type,time))
                printWriter.write("{'static':1}");
            else
                printWriter.write("{'static':0}");
    }
}
