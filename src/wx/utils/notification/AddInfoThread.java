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
    private Object[] params;
    public AddInfoThread(String tid, String message){
            params = new Object[]{tid,message};

    }
    @Override
    public void run() {
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into team_logs(tid,information)values(?,?)";
        try {
            queryRunner.update(sql,params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
