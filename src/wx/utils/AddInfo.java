package wx.utils;


import java.util.concurrent.ConcurrentHashMap;

public class AddInfo {
    //保存要插入数据库的消息<插入的对象，插入的消息>
    public static ConcurrentHashMap<String,String> map = new ConcurrentHashMap<>();
    public static void addMessage(String teamId,String message){
        map.put(teamId,message);
    }

}
