package wx.controller;

import com.google.gson.Gson;
import wx.domain.Label;
import wx.service.Service;
import wx.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Servlet12")
public class getIcon extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId = (String)request.getSession().getAttribute("token");
        Service service = new Service();
        List<Label> list = service.getIcon(openId);
        PrintWriter printWriter = response.getWriter();
        Gson gson = JsonUtils.getGson();
        printWriter.write("{'data':"+gson.toJson(list)+"}");
    }
}
