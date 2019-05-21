package wx.controller;

import com.google.gson.Gson;
import wx.domain.Bill;
import wx.service.Service;
import wx.utils.Verification;
import wx.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Servlet6")
public class getBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String time = request.getParameter("time");
        String openId =(String)request.getSession().getAttribute("token");
        PrintWriter printWriter = response.getWriter();
        Gson gson = JsonUtils.getGson();
        Service service = new Service();
        List<Bill> list = null;
        if(type.equals("0")){
            if(Verification.verify_time(time,2))
            {
                list = service.getBill(openId,time,0);
            }else
                printWriter.write(gson.toJson("参数不合法"));

        }
        else if(type.equals("1"))//日账
            {
                if(Verification.verify_time(time,3))
                {
                    list = service.getBill(openId,time,1);
                }else
                    printWriter.write(gson.toJson("参数不合法"));

            }else
            printWriter.write(gson.toJson("{'static':0}"));
        printWriter.write("{'data':"+gson.toJson(list)+"}");
    }
}
