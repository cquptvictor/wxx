package wx.utils.notification;

import com.google.gson.Gson;
import org.apache.commons.dbutils.QueryRunner;
import wx.utils.JdbcUtils;
import wx.utils.JsonUtils;

import java.sql.SQLException;
/*
帮助记录消息到数据库中，采用多线程可以异步，并且复用，应该加上日志，记录报错的消息
*/
public class AddInfoThread extends Thread{
    private String tid;
    private String message;
    public AddInfoThread(String tid, String message){
        this.tid = tid;
        this.message = message;
    }
    @Override
    public void run() {
        Gson gson = JsonUtils.getGson();
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into teamLogs(tid,information)values(?,?)";
        try {
            queryRunner.update(sql,new Object[]{tid,message});
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
