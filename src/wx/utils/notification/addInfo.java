package wx.utils.notification;

import com.google.gson.Gson;
import wx.domain.event.BillMessage;
import wx.domain.event.MemberMessage;
import wx.utils.JsonUtils;
/*
添加json化的通知到数据库
 */
public class addInfo {
    //关于账单操作的通知
    private Gson gson = JsonUtils.getGson();
    private Thread thread = null;
    public void BillInfo(String tid,String name, String event, String amount, String label, String operationTime,String openId){
        BillMessage billMessage = new BillMessage(name,event,amount,label,operationTime);
        thread = new AddInfoThread(tid,gson.toJson(billMessage),openId);
        thread.start();
    }
    //关于成员操作的通知
    public void MemberInfo(String tid,String operator, String name, String event, String time,String openId){
        MemberMessage memberMessage = new MemberMessage(operator,name,event,time);
        thread = new AddInfoThread(tid,gson.toJson(memberMessage), openId);
        thread.start();
    }
}
