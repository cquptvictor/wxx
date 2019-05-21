package wx.controller;
import com.google.gson.Gson;
import wx.service.Service;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;

@WebServlet(name = "Servlet")
public class authenticate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取code
        Service service = new Service();
        Gson gson = new Gson();
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        String openId = (String)session.getAttribute("token");
        //String openId = "oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ";
        OutputStream outputStream = response.getOutputStream();
        //要发送请求的那种
        if (code != null) {
            String[] value = null;
            try {
                value = service.authenticate(code);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if(value[0] != null){
                session.setAttribute("token",value[0]);
                session.setAttribute("isSignIn",value[1]);
               outputStream.write(gson.toJson("{'static':1}").getBytes("UTF8"));
           }
           else{
               outputStream.write(gson.toJson("{'static':0}").getBytes("UTF8"));
           }
        }
        //不用重新发送请求
        else if(openId != null) {
            try {
                if(service.authenticateById(openId))
                    outputStream.write(gson.toJson("{'static':1}").getBytes("UTF8"));
                else
                    outputStream.write(gson.toJson("{'static':0}").getBytes("UTF8"));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //如果两个参数都没有
        else
            outputStream.write(gson.toJson("{'static':0}").getBytes("UTF8"));
    }
}