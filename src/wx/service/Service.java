package wx.service;

import com.google.gson.Gson;
import wx.dao.userDao;
import wx.domain.AuthenticationCode;
import wx.domain.Bill;
import wx.domain.Label;
import wx.domain.userInfo;
import wx.utils.HttpURLConnectionHelper;
import wx.utils.JsonUtils;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Service {
    public String[] authenticate(String code) throws SQLException {
        String url = String.format("https://api.weixin.qq.com/sns/jscode2session?appid=wxa937455af6d42e4f&secret=e5b544b4140c3c98728cb6482e78af43&js_code=%s&grant_type=authorization_code", code);
        //请求微信后端
        String content = HttpURLConnectionHelper.sendRequest(url, "GET");
        userDao dao = new userDao();
        //处理json
        Gson gson = JsonUtils.getGson();
        //解析json
        AuthenticationCode authenticationCode = gson.fromJson(content, AuthenticationCode.class);
        //请求成功
        String uuid;
        String openId = authenticationCode.getOpenid();
        String[] values;
        if (openId != null) {
            if((values = dao.findUser(openId)) != null)
            //如果用户已存在
            {
                return values;
            }
            //用户不存在
            else {
                //生成唯一id
                 uuid = UUID.randomUUID().toString();
                if (dao.addUser(openId, uuid))
                    return new String[]{uuid,"false"};
                else
                    return null;
            }
            //请求失败
        } else
            return null;
    }
    public Boolean authenticateById(String openId) throws SQLException {
        //交给dao层查询用户是否存在
        //如果存在，则通过
        //不存在，则返回
           userDao dao = new userDao();
           if(dao.findUser(openId) == null)
               return false;
           else
               return  true;
    }

    public userInfo getUserInfo(String openId){
       userDao dao = new userDao();
       userInfo userInfo = dao.getUserInfo(openId);
       return userInfo;
    }

    public Boolean signIn(String openId){
        userDao dao = new userDao();
        return dao.signIn(openId);
    }

    public Boolean addBill(String openId,String label,String remarks,String time,float amount,String type){
        userDao dao = new userDao();
        Object[] params = {openId,amount,label,remarks,time,type};
        return dao.addBill(params);
    }

    public Boolean editBill(int bid, float amount, String label, String remarks,String type,String time){
        userDao dao = new userDao();
        Object[] params = {amount,label,remarks,type,time,bid};
        return dao.editBill(params);
    }

    //获取月度或日度账单
    public List<Bill> getBill(String openId, String time, int type){
        userDao dao = new userDao();
        return dao.getBill(openId,time,type);
    }

    public Boolean delBill(int bid) {
        userDao dao = new userDao();
        return dao.delBill(bid);
    }
    /*
       week 两个时间
       month和year一个时间，和一个类型表示
    */
    //需要的日期应该提前一天或一个月
    public Map linerGraphsService(String category, Date beginTime,String openId,String label) {
        userDao dao = new userDao();
        Object[] params = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String begin = null;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(beginTime);
        if(category.equals("week"))
        {
            calendar.add(Calendar.DATE,-1);//前一天
            begin = simpleDateFormat.format(calendar.getTime());
            if(label.equals("true")) {
                calendar.add(Calendar.DATE,7);
                String end = simpleDateFormat.format(calendar.getTime());
                params = new Object[]{begin,end,openId};
            }else
                params = new Object[]{begin,7,openId};
        }
        else if (category.equals("month")){//相差的天数需要手动计算,
            begin = simpleDateFormat.format(calendar.getTime());
            if(label.equals("true"))
            {
                params = new Object[]{begin,openId};
            }else{
                long b = calendar.getTimeInMillis();
                calendar.add(Calendar.DATE,-1);//前一天
                begin = simpleDateFormat.format(calendar.getTime());
                calendar.add(Calendar.MONTH,1);//找到下一个月的这一天
                long e = calendar.getTimeInMillis();
                long days =(long) (e - b)/(24 * 60 * 60 * 1000);//计算相差的天数
                params = new Object[]{begin,days,openId};
            }
        }
        else{
            if (label.equals("true")){
                begin = simpleDateFormat.format(calendar.getTime());
                params = new Object[]{begin,openId};
            }
            else{
                calendar.add(Calendar.MONTH, -1 );//前一个月
                begin = simpleDateFormat.format(calendar.getTime());
                params = new Object[]{begin,12,openId};

            }
        }
        return  dao.linerGraphDao(category, params,label);

    }

    public Boolean operateIcon(String openId, String name, String label,String operate){
        userDao dao = new userDao();
        Object[] params ;
       if(operate.equalsIgnoreCase("set"))
             params = new Object[]{openId,label,name};
       else
           params = new Object[]{openId,label};
       return dao.operateIcon(params,operate);
    }
    public List<Label> getIcon(String openId){
        userDao dao = new userDao();
        return dao.getIcon(openId);
    }
    public Map getBadge(String openId){
        userDao dao = new userDao();
        return dao.getBadge(openId);
    }
    public Boolean addBadge(String openId, String badge,String type)
    {
        userDao dao = new userDao();
        Object[] params = new Object[]{openId,badge,type};
        return dao.addBadge(params);
    }
}
