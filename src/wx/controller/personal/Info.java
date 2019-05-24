package wx.controller.personal;

import com.google.gson.Gson;
import wx.domain.userInfo;
import wx.service.Service;
import wx.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "Servlet2")
public class Info extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String openId =  (String)request.getSession().getAttribute("token");
        Gson gson = JsonUtils.getGson();
        OutputStream outputStream = response.getOutputStream();
        if(openId == null)//登录失效
            outputStream.write(gson.toJson("{'static':0}").getBytes("UTF8"));
        else{
            Service service = new Service();
            userInfo userInfo = service.getUserInfo(openId);
            outputStream.write(gson.toJson(userInfo).getBytes("UTF8"));
        }
    }
}
